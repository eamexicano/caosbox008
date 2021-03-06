//written by @joseCao5
//CaosBox Main Instrument sequencer and steps
////////////////////////////////////////////
//this sequence the Instruments of the melodic part of CaosBox
///////////////////////////////////////////
//Secuencias
(
Tdef(\secuencias,{
//orden de ejecucion
//master var
~mast=Synth(\master);
// fx
~mastrev=Synth(\aux1);
~mastdel=Synth(\aux2);
~mastpit=Synth(\aux3);
//Filtros
~mastlowf=Synth(\lowfilt);
~masthighf=Synth(\highfilt);
~mastbandf=Synth(\bandfilt);
//granulador
~grains=Synth(\granulador);
		{
		~bombo[~indice].play;
		~tarola[~indice].play;
		~contras[~indice].play;
		~bombo2[~indice].play;
		~tarola2[~indice].play;
		~contras2[~indice].play;
        if(~bajo[~indice] == nil,{nil},{~bajo[~indice].set(\gate,1,\att,~bass1attknob.value,\rel,~bass1relknob.value);~bajo.put(~indice,~bass=Synth(\bajouno))});
		if(~bajo2[~indice] == nil,{nil},{~bajo2[~indice].set(\gate,1,\att,~bass2attknob.value,\rel,~bass2relknob.value);~bajo2.put(~indice,~bass2=Synth(\bajodos))});
		if(~ambiente[~indice] == nil,{nil},{~ambiente[~indice].set(\gate,1,\att,~amb1attknob.value,\rel,~amb1relknob.value);~ambiente.put(~indice,~amb=Synth(\ambuno))});
		if(~ambiente2[~indice] == nil,{nil},{~ambiente2[~indice].set(\gate,1,\att,~amb2attknob.value,\rel,~amb2relknob.value);~ambiente2.put(~indice,~amb2=Synth(\ambdos))});
		//~sinte[~indice].set(\t_trig,1);
		//~sinte2[~indice].set(\t_trig,1);
		if(~in[~indice] == nil,{nil},{~in[~indice].set(\gate,1,\att,~inattknob.value,\rel,~inrelknob.value);~in.put(~indice,~entrada=Synth(\ent))});
    	~indice=~indice+1;
   	 	if(~indice==32,{~indice=0},{nil});
		~tiempos.wait;
	}.loop;
});
);
//guide light steps
(
Tdef(\pasos,{
//pasos 
		{
		{if(~indice==0,{~step1.value=1;~step32.value=0;});
		if(~indice==1,{~step2.value=1;~step1.value=0;});
		if(~indice==2,{~step3.value=1;~step2.value=0;});
        if(~indice==3,{~step4.value=1;~step3.value=0;});
        if(~indice==4,{~step5.value=1;~step4.value=0;});
        if(~indice==5,{~step6.value=1;~step5.value=0;});
        if(~indice==6,{~step7.value=1;~step6.value=0;});
        if(~indice==7,{~step8.value=1;~step7.value=0;});
        if(~indice==8,{~step9.value=1;~step8.value=0;});
        if(~indice==9,{~step10.value=1;~step9.value=0;});
        if(~indice==10,{~step11.value=1;~step10.value=0;});
        if(~indice==11,{~step12.value=1;~step11.value=0;});
        if(~indice==12,{~step13.value=1;~step12.value=0;});
        if(~indice==13,{~step14.value=1;~step13.value=0;});
        if(~indice==14,{~step15.value=1;~step14.value=0;});
        if(~indice==15,{~step16.value=1;~step15.value=0;});
        if(~indice==16,{~step17.value=1;~step16.value=0;});
        if(~indice==17,{~step18.value=1;~step17.value=0;});
        if(~indice==18,{~step19.value=1;~step18.value=0;});
		if(~indice==19,{~step20.value=1;~step19.value=0;});
        if(~indice==20,{~step21.value=1;~step20.value=0;});
        if(~indice==21,{~step22.value=1;~step21.value=0;});
        if(~indice==22,{~step23.value=1;~step22.value=0;});
        if(~indice==23,{~step24.value=1;~step23.value=0;});
        if(~indice==24,{~step25.value=1;~step24.value=0;});
        if(~indice==25,{~step26.value=1;~step25.value=0;});
        if(~indice==26,{~step27.value=1;~step26.value=0;});
        if(~indice==27,{~step28.value=1;~step27.value=0;});
        if(~indice==28,{~step29.value=1;~step28.value=0;});
        if(~indice==29,{~step30.value=1;~step29.value=0;});
        if(~indice==30,{~step31.value=1;~step30.value=0;});
        if(~indice==31,{~step32.value=1;~step31.value=0;})}.defer(0.1);
		~tiempos.wait;
	}.loop;
});
);
(//tiempo random
Tdef(\randtime,{
    {
        var timer=Prand(~randtimes,inf).asStream;
        TempoClock.tempo=timer.next/60;
        ~tiempos.wait;
	}.loop;
});
);
//
/*
//s.queryAllNodes
/*
~gmast=Group.head;
~gaux=Group.before(~gmast);
~gfilt=Group.before(~gaux);
~ginst=Group.before(~gfilt);
*/
//nodos
//master var
~mast=Synth.head(~gmast,\master);
// fx
~mastrev=Synth.head(~gaux,\aux1);
~mastdel=Synth.before(~mastrev,\aux2);
~mastpit=Synth.before(~mastdel,\aux3);
//Filtros
~mastlowf=Synth.head(~gfilt,\lowfilt);
~masthighf=Synth.before(~mastlowf,\highfilt);
~mastbandf=Synth.before(~masthighf,\bandfilt);
//granulador
~grains=Synth.before(~mastbandf,\granulador);
*/
