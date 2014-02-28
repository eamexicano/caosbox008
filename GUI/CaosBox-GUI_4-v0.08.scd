(//CaosBox GUI 4 v0.08 - filtros, freqscope, bpm, granulador, onClose
//filter min max values
~fmaxmin=ControlSpec(20,20000,\exponential,1,1000);
~rqmaxmin=ControlSpec(0.01,1,\lin,0.01,0.5);
//Filter Aux tag
~filttag=StaticText(~w,Rect(575,290,205,12));
~filttag.string_("Filter-> code out to channel:").align_(\center).background_(Color(0.85,0.85,0.85));
//Lowpass tag
~lowfiltag=StaticText(~w,Rect(575,305,205,12));
~lowfiltag.string_("LowPassFilter:58").align_(\center).background_(Color(0.75,0.75,0.75));
//Lowpass out
~lowoutpop=PopUpMenu(~w,Rect(575,320,205,15)).items=["LowPassFilter Out to Master","LowPassFilter Out to Reverb",
														"LowPassFilter Out to Delay","LowPassFilter Out to Pitch"];
~lowoutpop.background_(Color(0.05,0.05,0.25,1)).stringColor_(Color.gray(0.5));
~lowoutpop.action={|menu| if(menu.value==0,{~mastlowf.set(\out,50)});
						  if(menu.value==1,{~mastlowf.set(\out,52)});
						  if(menu.value==2,{~mastlowf.set(\out,54)});
						  if(menu.value==3,{~mastlowf.set(\out,56)});
				 };
//Lowpass cutfreq
StaticText(~w,Rect(575,338,125,14)).string_("Cut Frequency").align_(\center).background_(Color(0,0.5,0));
~numf1=NumberBox(~w,Rect(700,337,80,16)).background_(Color(0,1,0));
~lowcfader=Slider(~w,Rect(575,355,205,20)).background_(Color(0.05,0.05,0.25,0.1));
~lowcfader.action={~mastlowf.set(\cutfreq,~fmaxmin.map(~lowcfader.value));~numf1.value_(~fmaxmin.map(~lowcfader.value))};
~numf1.action={~mastlowf.set(\cutfreq,~fmaxmin.map(~numf1.value));~lowcfader.value_(~fmaxmin.map(~numf1.value))};
~lowcfader.value=20000;
~numf1.value=20000;
//rq
StaticText(~w,Rect(575,380,125,14)).string_("Bandwidth").align_(\center).background_(Color(0,0.5,0));
~numf2=NumberBox(~w,Rect(700,379,80,16)).background_(Color(0,1,0));
~lowrqfader=Slider(~w,Rect(575,400,205,10)).background_(Color(0.05,0.05,0.25,0.1));
~lowrqfader.action={~mastlowf.set(\rq,~rqmaxmin.map(~lowrqfader.value));~numf2.value_(~rqmaxmin.map(~lowrqfader.value))};
~numf2.action={~mastlowf.set(\rq,~rqmaxmin.map(~numf2.value));~lowrqfader.value_(~rqmaxmin.map(~numf2.value))};
~lowrqfader.value=0.5;
~numf2.value=0.5;
//Highpass tag
~highfiltag=StaticText(~w,Rect(575,420,205,12));
~highfiltag.string_("HighPassFilter:60").align_(\center).background_(Color(0.75,0.75,0.75));
//Highpass out
~highoutpop=PopUpMenu(~w,Rect(575,435,205,15)).items=["HighPassFilter Out to Master","HighPassFilter Out to Reverb",
														"HighPassFilter Out to Delay","HighPassFilter Out to Pitch"];
~highoutpop.background_(Color(0.05,0.05,0.25,1)).stringColor_(Color.gray(0.5));
~highoutpop.action={|menu| if(menu.value==0,{~masthighf.set(\out,50)});
						  if(menu.value==1,{~masthighf.set(\out,52)});
						  if(menu.value==2,{~masthighf.set(\out,54)});
						  if(menu.value==3,{~masthighf.set(\out,56)});
				 };
//Highpass cutfreq
StaticText(~w,Rect(575,453,125,14)).string_("Cut Frequency").align_(\center).background_(Color(0,0.5,0));
~numf3=NumberBox(~w,Rect(700,452,80,16)).background_(Color(0,1,0));
~highcfader=Slider(~w,Rect(575,470,205,20)).background_(Color(0.05,0.05,0.25,0.1));
~highcfader.action={~masthighf.set(\cutfreq,~fmaxmin.map(~highcfader.value));~numf3.value_(~fmaxmin.map(~highcfader.value))};
~numf3.action={~masthighf.set(\cutfreq,~fmaxmin.map(~numf3.value));~highcfader.value_(~fmaxmin.map(~numf3.value))};
~highcfader.value=0.15;
~numf3.value=45;
//rq
StaticText(~w,Rect(575,493,125,14)).string_("Bandwidth").align_(\center).background_(Color(0,0.5,0));
~numf4=NumberBox(~w,Rect(700,492,80,16)).background_(Color(0,1,0));
~highrqfader=Slider(~w,Rect(575,510,205,10)).background_(Color(0.05,0.05,0.25,0.1));
~highrqfader.action={~masthighf.set(\rq,~rqmaxmin.map(~highrqfader.value));~numf4.value_(~rqmaxmin.map(~highrqfader.value))};
~numf4.action={~masthighf.set(\rq,~rqmaxmin.map(~numf4.value));~highrqfader.value_(~rqmaxmin.map(~numf4.value))};
~highrqfader.value=0.5;
~numf4.value=0.5;
//Bandpass tag
~bandfiltag=StaticText(~w,Rect(575,530,205,12));
~bandfiltag.string_("BandPassFilter:62").align_(\center).background_(Color(0.75,0.75,0.75));
//Bandpass out
~bandoutpop=PopUpMenu(~w,Rect(575,545,205,15)).items=["BandPassFilter Out to Master","BandPassFilter Out to Reverb",
														"BandPassFilter Out to Delay","BandPassFilter Out to Pitch"];
~bandoutpop.background_(Color(0.05,0.05,0.25,1)).stringColor_(Color.gray(0.5));
~bandoutpop.action={|menu| if(menu.value==0,{~mastbandf.set(\out,50)});
						  if(menu.value==1,{~mastbandf.set(\out,52)});
						  if(menu.value==2,{~mastbandf.set(\out,54)});
						  if(menu.value==3,{~mastbandf.set(\out,56)});
				 };
//Bandpass cutfreq
StaticText(~w,Rect(575,563,125,14)).string_("Cut Frequency").align_(\center).background_(Color(0,0.5,0));
~numf5=NumberBox(~w,Rect(700,562,80,16)).background_(Color(0,1,0));
~bandcfader=Slider(~w,Rect(575,580,205,20)).background_(Color(0.05,0.05,0.25,0.1));
~numf5.action={~mastbandf.set(\cutfreq,~fmaxmin.map(~numf5.value));~bandcfader.value_(~fmaxmin.map(~numf5.values))};
~bandcfader.action={~mastbandf.set(\cutfreq,~fmaxmin.map(~bandcfader.value));~numf5.value_(~fmaxmin.map(~bandcfader.value))};
~bandcfader.value=20000;
~numf5.value=20000;
//rq
StaticText(~w,Rect(575,603,125,14)).string_("Bandwidth").align_(\center).background_(Color(0,0.5,0));
~numf6=NumberBox(~w,Rect(700,602,80,16)).background_(Color(0,1,0));
~bandrqfader=Slider(~w,Rect(575,620,205,10)).background_(Color(0.05,0.05,0.25,0.1));
~bandrqfader.action={~mastbandf.set(\rq,~rqmaxmin.map(~bandrqfader.value));~numf6.value_(~rqmaxmin.map(~bandrqfader.value))};
~numf6.action={~mastbandf.set(\rq,~rqmaxmin.map(~numf6.value));~bandrqfader.value_(~rqmaxmin.map(~numf6.value))};
~bandrqfader.value=0.5;
~numf6.value=0.5;
//freqscope
StaticText(~w,Rect(785,12,155,15)).string_("Frequency Analizer:").align_(\center).background_(Color(0.85,0.85,0.85));
~fbot=Button(~w,Rect(940,12,80,15));
~fbot.states=[["On",Color.black,Color.green],
        ["Off",Color.white,Color.red]];
~fbot.action={|val| if(val.value==0,{~f.active_(false);"->Frequency Analizer has been Stopped<-".postcln},
        							{~f.active_(true);"->Frequency Analizer has Started<-".postcln})};        							
~f=FreqScopeView(~w,Rect(785,27,235,100)).freqMode_(1);
~f.active_(false);
//granulator
~grandcolor=Color(0,rrand(0.01,0.5),rrand(0.01,0.5));
StaticText(~w,Rect(785,290,235,12)).string_("Granulator-> code out to channel: 64").align_(\center).background_(Color(0.85,0.85,0.85));
//granulator out
~grainpop=PopUpMenu(~w,Rect(785,305,235,30)).items=["Granulator Out to Master","Granulator Out to Reverb",
														"Granulator Out to Delay","Granulator Out to Pitch"];
~grainpop.background_(~grandcolor).stringColor_(Color.gray(0.5));
~grainpop.action={|menu| if(menu.value==0,{~grains.set(\out,50)});
						  if(menu.value==1,{~grains.set(\out,52)});
						  if(menu.value==2,{~grains.set(\out,54)});
						  if(menu.value==3,{~grains.set(\out,56)});
						  };
//granulator values
~gtparam=ControlSpec.new(4,32,\lin,1,4);
~gsparam=ControlSpec.new(0.01,0.05,\lin,0.001,0.05);
~gfaders=Slider2D(~w, Rect(785,340,235,195));
//~gtparam.map(~gfaders.x.value);
//~gsparam.map(~gfaders.y.value);
~gfaders.action_({|sl| ~grains.set(\trigger,~gtparam.map(sl.x.value.postln),\size,~gsparam.map(sl.y.value.postln))});
~gfaders.background_(~grandcolor);
//Automatizacion granulador
StaticText(~w,Rect(785,540,235,12)).string_("Auto/Speed").align_(\center).background_(Color(0.5,0.5,0.5));
~autopopg=PopUpMenu(~w,Rect(785,555,235,25)).items=["normal","fast","slow","slowest"];
~autopopg.background_(~grandcolor).stringColor_(Color.gray(0.5));
~autopopg.action={|menu| if(menu.value==0,{~divgrain=1});
						 if(menu.value==1,{~divgrain=0.5});
						 if(menu.value==2,{~divgrain=2});
						 if(menu.value==3,{~divgrain=4})
				 };
//clock
StaticText(~w,Rect(785,272,185,15)).string_("Set Master BeatsPerMinute:").align_(\center).background_(Color(1,0,0));
~numclock=NumberBox(~w,Rect(970,272,50,15)).background_(Color(0,1,0)).align_(\ceneter);
~numclock.value=94;
~numclock.action={~clock={TempoClock.tempo=~numclock.value/60};~clock.value};
//
~w.onClose={Tdef(\secuencias).stop;Tdef(\pasos).stop;Tdef(\autor).stop;Tdef(\autod).stop;Tdef(\autop).stop;Tdef(\autog).stop;
				~autobotr.value=0;~autobotd.value=0;~autobotp.value=0;~autobotg.value=0;~bott.value=0;~f.kill;~grains.free};
)