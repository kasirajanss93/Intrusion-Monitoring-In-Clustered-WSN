#ifndef __environment_h__
#define __environment_h__

#include <cmu-trace.h>
#include <classifier/classifier-port.h>
#include <mobilenode.h>

class ENVIRONMENT;
class ReportTimer : public Handler {
public:
        ReportTimer(ENVIRONMENT* a) : agent(a) {}
        void	handle(Event*);
private:
        ENVIRONMENT    *agent;
	Event	intr;
};

class	ENVIRONMENT:public Agent {
public:
	friend class ReportTimer;
	
	ReportTimer	rtimer;
	void	report();
	ENVIRONMENT();
	NsObject*	target_list[500];
	nsaddr_t	target_id[500];
	int		t_count;
        int             command(int, const char *const *);
        double		MAX_TMP;
        nsaddr_t	BS_ID;
        double		region;
        double		distance(double,double,double,double);
        double		packetSize;
	int		stop;
	int		rate_flag;
	double		interval_;
};

#endif
