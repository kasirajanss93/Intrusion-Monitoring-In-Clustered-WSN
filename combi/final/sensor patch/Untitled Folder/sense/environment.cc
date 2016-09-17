#include <iostream>
#include <random.h>
#include <sense/environment.h>

#define nodes	God::instance()->nodes()

#define REPORT_INTR	nodes/10


static class ENVIRONMENTclass : public TclClass {
public:
        ENVIRONMENTclass() : TclClass("Agent/ENVIRONMENT") {}
        TclObject* create(int argc, const char*const* argv) {
	  return (new ENVIRONMENT());
        }
} class_Env;


ENVIRONMENT::ENVIRONMENT() : Agent(PT_SENSE),rtimer(this)
{
	t_count	=	0;
	bind("MAX_TMP",&MAX_TMP);
	bind("BS_ID",&BS_ID);
	bind("region",&region);
	bind("packetSize",&packetSize);
	bind("rate_flag",&rate_flag);
	bind("interval_",&interval_);
}

int
ENVIRONMENT::command(int argc, const char*const* argv)
{

if(strcmp(argv[1], "begin_sense") == 0)
{
stop	=	0;
rtimer.handle((Event*)0);
return TCL_OK;
}


if(strcmp(argv[1], "stop_sense") == 0)
{
stop = 1;
return TCL_OK;
}

if(strcmp(argv[1], "get_sensor") == 0)
{
target_list[t_count]	=	(NsObject*)TclObject::lookup(argv[2]);
target_id[t_count]	=	atoi(argv[3]);
t_count++;
return TCL_OK;
}
  return Agent::command(argc, argv);
}


void	ReportTimer::handle(Event*) {
if(agent->stop == 0)
  agent->report();
  if(agent->rate_flag == 0)
	Scheduler::instance().schedule(this, &intr, REPORT_INTR);
  else
	Scheduler::instance().schedule(this, &intr, agent->interval_);
}

void	ENVIRONMENT::report()
{
	double region_tmp = Random::uniform(MAX_TMP/3,MAX_TMP);
	
	int	val = region/20+1;
	
	double	region_change[1000];
	int	ii=0;
	
	region_change[0]	=	region_tmp;

	for(int j=1;j<val;j++)
	{
		if(j%2 == 0)
			region_change[j]  =  Random::uniform(region_change[j-1],region_change[j-1]+20);
		else
			region_change[j]  =  Random::uniform(region_change[j-1]-20,region_change[j-1]);
		ii++;
	}

	cout<<"Tmp list: "<<endl;

	for(int i=0;i<ii+1;i++)
	{
		cout<<region_change[i]<<" ";
	}
	cout<<endl;
	
	Packet *p = Packet::alloc();
	struct hdr_cmn *ch = HDR_CMN(p);
	struct hdr_ip *ih = HDR_IP(p);
	
	ch->event	=	TEMP;
	ch->temp	=	region_change[0];
	ch->ptype()	=	PT_SENSE;
	ih->daddr()	=	BS_ID;
	ch->size()	=	packetSize;

	for(int i=0;i<t_count;i++)
	{
		MobileNode* n_ = (MobileNode*)Node::get_node_by_address(target_id[i]);
		double d_ = distance(n_->X(),n_->Y(),0,0);
		
		for(int j=0;j<val;j++)
		{
			if(d_ > j*20 && d_ < (j+1)*20)
			{
				ch->temp	=	region_change[j];
			}
		}
		
		ih->saddr()	=	target_id[i];
		cout<<"Node: "<<target_id[i]<<" "<<d_<<" "<<ch->temp<<endl;

	  if(rate_flag == 1)
		Scheduler::instance().schedule(target_list[i],p->copy(),Random::uniform(0,interval_));
	  else
		Scheduler::instance().schedule(target_list[i],p->copy(),Random::uniform(0,REPORT_INTR));
	}
}


double	ENVIRONMENT::distance(double x,double y,double x1,double y1)
{
	return sqrt(pow(x-x1,2)+pow(y-y1,2));
}
