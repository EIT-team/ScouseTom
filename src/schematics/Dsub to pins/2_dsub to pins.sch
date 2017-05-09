<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.2.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="9" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="mayo">
<packages>
<package name="22-23-2021">
<description>.100" (2.54mm) Center Headers - 2 Pin</description>
<pad name="1" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-23-2021" prefix="X">
<description>.100" (2.54mm) Center Header - 1 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="0" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2021">
<connects>
<connect gate="-1" pin="S" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2021" constant="no"/>
<attribute name="OC_FARNELL" value="1462926" constant="no"/>
<attribute name="OC_NEWARK" value="25C3832" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-subd">
<description>&lt;b&gt;SUB-D Connectors&lt;/b&gt;&lt;p&gt;
Harting&lt;br&gt;
NorComp&lt;br&gt;
&lt;p&gt;
PREFIX :&lt;br&gt;
H = High density&lt;br&gt;
F = Female&lt;br&gt;
M = Male&lt;p&gt;
NUMBER: Number of pins&lt;p&gt;
SUFFIX :&lt;br&gt;
H = Horizontal&lt;br&gt;
V = Vertical &lt;br&gt;
P = Shield pin on housing&lt;br&gt;
B = No mounting holes&lt;br&gt;
S = Pins individually placeable (Single)&lt;br&gt;
D = Direct mounting &lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="M37D">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-28.042" y1="6.745" x2="-27.534" y2="7.253" width="0.1524" layer="21" curve="-90"/>
<wire x1="27.534" y1="7.253" x2="28.042" y2="6.745" width="0.1524" layer="21" curve="-90"/>
<wire x1="28.042" y1="2.046" x2="28.042" y2="6.745" width="0.1524" layer="21"/>
<wire x1="28.042" y1="2.046" x2="28.677" y2="1.411" width="0.1524" layer="21" curve="90"/>
<wire x1="-28.042" y1="2.046" x2="-28.042" y2="6.745" width="0.1524" layer="21"/>
<wire x1="-28.677" y1="1.411" x2="-28.042" y2="2.046" width="0.1524" layer="21" curve="90"/>
<wire x1="-27.534" y1="7.253" x2="27.534" y2="7.253" width="0.1524" layer="21"/>
<wire x1="-32.9184" y1="-2.7432" x2="-31.5468" y2="-4.1148" width="0.254" layer="48"/>
<wire x1="-31.5468" y1="-4.1148" x2="-30.1752" y2="-2.7432" width="0.254" layer="48"/>
<wire x1="-30.1752" y1="-2.7432" x2="-28.8036" y2="-4.1148" width="0.254" layer="48"/>
<wire x1="-28.8036" y1="-4.1148" x2="-27.432" y2="-2.7432" width="0.254" layer="48"/>
<wire x1="27.432" y1="-2.7432" x2="28.8036" y2="-4.1148" width="0.254" layer="48"/>
<wire x1="28.8036" y1="-4.1148" x2="30.1752" y2="-2.7432" width="0.254" layer="48"/>
<wire x1="30.1752" y1="-2.7432" x2="31.5468" y2="-4.1148" width="0.254" layer="48"/>
<wire x1="31.5468" y1="-4.1148" x2="32.9184" y2="-2.7432" width="0.254" layer="48"/>
<wire x1="5.08" y1="3.669" x2="2.794" y2="3.669" width="0.1524" layer="21"/>
<wire x1="2.794" y1="3.669" x2="2.794" y2="5.955" width="0.1524" layer="21"/>
<wire x1="5.08" y1="5.955" x2="5.08" y2="3.669" width="0.1524" layer="21"/>
<wire x1="1.143" y1="3.669" x2="-1.143" y2="3.669" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="3.669" x2="-1.143" y2="5.955" width="0.1524" layer="21"/>
<wire x1="1.143" y1="5.955" x2="1.143" y2="3.669" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="3.669" x2="-5.08" y2="3.669" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.669" x2="-5.08" y2="5.955" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="5.955" x2="-2.794" y2="3.669" width="0.1524" layer="21"/>
<wire x1="-26.8732" y1="0.508" x2="-26.8732" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-26.8732" y1="0.508" x2="-26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-26.7462" y1="-1.905" x2="-26.1112" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-26.7462" y1="-1.905" x2="-26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-26.13" y1="-2.54" x2="26.13" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="26.8732" y1="0.508" x2="26.8732" y2="1.016" width="0.1524" layer="21"/>
<wire x1="26.7462" y1="-1.905" x2="26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="26.7462" y1="0.508" x2="26.8732" y2="0.508" width="0.1524" layer="21"/>
<wire x1="26.1112" y1="-2.54" x2="26.7462" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<smd name="1" x="24.689" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="2" x="21.9458" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="3" x="19.2022" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="4" x="16.4594" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="5" x="13.716" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="6" x="10.9726" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="7" x="8.2298" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="8" x="5.4862" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="9" x="2.7434" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="10" x="0" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="11" x="-2.7434" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="12" x="-5.4862" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="13" x="-8.2298" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="14" x="-10.9726" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="15" x="-13.716" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="16" x="-16.4594" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="17" x="-19.2022" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="18" x="-21.9458" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="19" x="-24.689" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="20" x="23.3172" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="21" x="20.574" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="22" x="17.8308" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="23" x="15.0876" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="24" x="12.3444" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="25" x="9.6012" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="26" x="6.858" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="27" x="4.1148" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="28" x="1.3716" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="29" x="-1.3716" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="30" x="-4.1148" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="31" x="-6.858" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="32" x="-9.6012" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="33" x="-12.3444" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="34" x="-15.0876" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="35" x="-17.8308" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="36" x="-20.574" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="37" x="-23.3172" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<text x="-10.2616" y="-11.5316" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.1016" y="-11.5316" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="24.5552" y="-2.1786" size="1.27" layer="21" ratio="10">1</text>
<text x="-22.0902" y="-0.625" size="1.27" layer="22" ratio="10" rot="MR0">37</text>
<text x="-25.5902" y="-2.1786" size="1.27" layer="21" ratio="10">19</text>
<text x="24.4552" y="-0.725" size="1.27" layer="22" ratio="10" rot="MR0">20</text>
<text x="-25.4508" y="4.5974" size="1.27" layer="51" ratio="10">M37D</text>
<text x="-32.9692" y="-2.54" size="1.27" layer="48">Board </text>
<text x="27.8892" y="-2.54" size="1.27" layer="48">Board</text>
<rectangle x1="22.7172" y1="-6.56" x2="23.9172" y2="-4.06" layer="52"/>
<rectangle x1="24.0888" y1="-6.56" x2="25.2888" y2="-4.06" layer="51"/>
<rectangle x1="19.974" y1="-6.56" x2="21.174" y2="-4.06" layer="52"/>
<rectangle x1="21.3456" y1="-6.56" x2="22.5456" y2="-4.06" layer="51"/>
<rectangle x1="17.2308" y1="-6.56" x2="18.4308" y2="-4.06" layer="52"/>
<rectangle x1="18.6024" y1="-6.56" x2="19.8024" y2="-4.06" layer="51"/>
<rectangle x1="14.4876" y1="-6.56" x2="15.6876" y2="-4.06" layer="52"/>
<rectangle x1="15.8592" y1="-6.56" x2="17.0592" y2="-4.06" layer="51"/>
<rectangle x1="11.7444" y1="-6.56" x2="12.9444" y2="-4.06" layer="52"/>
<rectangle x1="13.116" y1="-6.56" x2="14.316" y2="-4.06" layer="51"/>
<rectangle x1="9.0012" y1="-6.56" x2="10.2012" y2="-4.06" layer="52"/>
<rectangle x1="10.3728" y1="-6.56" x2="11.5728" y2="-4.06" layer="51"/>
<rectangle x1="6.258" y1="-6.56" x2="7.458" y2="-4.06" layer="52"/>
<rectangle x1="7.6296" y1="-6.56" x2="8.8296" y2="-4.06" layer="51"/>
<rectangle x1="3.5148" y1="-6.56" x2="4.7148" y2="-4.06" layer="52"/>
<rectangle x1="4.8864" y1="-6.56" x2="6.0864" y2="-4.06" layer="51"/>
<rectangle x1="0.7716" y1="-6.56" x2="1.9716" y2="-4.06" layer="52"/>
<rectangle x1="2.1432" y1="-6.56" x2="3.3432" y2="-4.06" layer="51"/>
<rectangle x1="-1.9716" y1="-6.56" x2="-0.7716" y2="-4.06" layer="52"/>
<rectangle x1="-0.6" y1="-6.56" x2="0.6" y2="-4.06" layer="51"/>
<rectangle x1="-4.7148" y1="-6.56" x2="-3.5148" y2="-4.06" layer="52"/>
<rectangle x1="-3.3432" y1="-6.56" x2="-2.1432" y2="-4.06" layer="51"/>
<rectangle x1="-7.458" y1="-6.56" x2="-6.258" y2="-4.06" layer="52"/>
<rectangle x1="-6.0864" y1="-6.56" x2="-4.8864" y2="-4.06" layer="51"/>
<rectangle x1="-10.2012" y1="-6.56" x2="-9.0012" y2="-4.06" layer="52"/>
<rectangle x1="-8.8296" y1="-6.56" x2="-7.6296" y2="-4.06" layer="51"/>
<rectangle x1="-12.9444" y1="-6.56" x2="-11.7444" y2="-4.06" layer="52"/>
<rectangle x1="-11.5728" y1="-6.56" x2="-10.3728" y2="-4.06" layer="51"/>
<rectangle x1="-15.6876" y1="-6.56" x2="-14.4876" y2="-4.06" layer="52"/>
<rectangle x1="-14.316" y1="-6.56" x2="-13.116" y2="-4.06" layer="51"/>
<rectangle x1="-18.4308" y1="-6.56" x2="-17.2308" y2="-4.06" layer="52"/>
<rectangle x1="-17.0592" y1="-6.56" x2="-15.8592" y2="-4.06" layer="51"/>
<rectangle x1="-21.174" y1="-6.56" x2="-19.974" y2="-4.06" layer="52"/>
<rectangle x1="-19.8024" y1="-6.56" x2="-18.6024" y2="-4.06" layer="51"/>
<rectangle x1="-23.9172" y1="-6.56" x2="-22.7172" y2="-4.06" layer="52"/>
<rectangle x1="-22.5456" y1="-6.56" x2="-21.3456" y2="-4.06" layer="51"/>
<rectangle x1="-25.2888" y1="-6.56" x2="-24.0888" y2="-4.06" layer="51"/>
<rectangle x1="-34.7" y1="0.9" x2="34.7" y2="1.4" layer="21"/>
<rectangle x1="-25.7" y1="-4.1" x2="25.7" y2="-2.5" layer="21"/>
</package>
<package name="M37H">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="27.559" y1="-17.526" x2="27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.559" y1="-17.526" x2="28.067" y2="-17.018" width="0.1524" layer="21" curve="90"/>
<wire x1="-28.067" y1="-17.018" x2="-27.559" y2="-17.526" width="0.1524" layer="21" curve="90"/>
<wire x1="27.686" y1="-11.684" x2="-27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="34.798" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-10.668" x2="34.798" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-11.176" x2="34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-11.684" x2="-34.798" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-11.176" x2="-34.798" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-10.668" x2="-34.798" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-7.62" x2="-34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-10.668" x2="29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-10.668" x2="29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="28.956" y1="-7.62" x2="29.591" y2="-8.255" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.718" y1="-7.62" x2="28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-7.62" x2="28.575" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="29.591" y1="-8.255" x2="29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-7.62" x2="28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-7.62" x2="-28.575" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-6.858" x2="-28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-7.62" x2="-28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-7.62" x2="-28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="-7.62" x2="-29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-10.668" x2="-29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-8.255" x2="-29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-10.668" x2="-29.718" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-8.255" x2="-28.956" y2="-7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="34.163" y1="3.175" x2="34.798" y2="2.54" width="0.1524" layer="21"/>
<wire x1="34.798" y1="2.54" x2="34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="29.337" y1="3.175" x2="34.163" y2="3.175" width="0.1524" layer="21"/>
<wire x1="29.337" y1="3.175" x2="28.829" y2="2.667" width="0.1524" layer="21"/>
<wire x1="28.829" y1="2.667" x2="28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="2.667" x2="-28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="2.667" x2="-29.337" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="3.175" x2="-34.29" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-34.29" y1="3.175" x2="-34.798" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="2.667" x2="-34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="1.143" x2="-11.049" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-8.2804" y1="1.143" x2="-8.2804" y2="0.127" width="0.8128" layer="51"/>
<wire x1="11.049" y1="1.143" x2="11.049" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-6.9088" y1="-1.397" x2="-6.9088" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-9.652" y1="-1.397" x2="-9.652" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-12.4206" y1="-1.397" x2="-12.4206" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-13.8176" y1="1.143" x2="-13.8176" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-15.1892" y1="-1.397" x2="-15.1892" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-16.5608" y1="1.143" x2="-16.5608" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-29.718" y1="-7.62" x2="-34.798" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-11.684" x2="-34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-28.067" y1="-12.319" x2="-28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="-28.702" y1="-11.684" x2="-28.067" y2="-12.319" width="0.1524" layer="21" curve="-90"/>
<wire x1="34.798" y1="-11.684" x2="27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.702" y2="-11.684" width="0.1524" layer="21" curve="-90"/>
<wire x1="-17.9578" y1="-1.3716" x2="-17.9578" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-19.3294" y1="1.143" x2="-19.3294" y2="0.127" width="0.8128" layer="51"/>
<wire x1="12.4206" y1="-1.397" x2="12.4206" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="13.7922" y1="1.143" x2="13.7922" y2="0.127" width="0.8128" layer="51"/>
<wire x1="15.1892" y1="-1.397" x2="15.1892" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="16.5608" y1="1.143" x2="16.5608" y2="0.127" width="0.8128" layer="51"/>
<wire x1="17.9324" y1="-1.397" x2="17.9324" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="19.3294" y1="1.143" x2="19.3294" y2="0.127" width="0.8128" layer="51"/>
<wire x1="22.0726" y1="1.143" x2="22.0726" y2="0.127" width="0.8128" layer="51"/>
<wire x1="20.701" y1="-1.397" x2="20.701" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="24.8412" y1="1.143" x2="24.8412" y2="0.127" width="0.8128" layer="51"/>
<wire x1="23.4696" y1="-1.397" x2="23.4696" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-22.098" y1="1.143" x2="-22.098" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-20.701" y1="-1.3716" x2="-20.701" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-23.4696" y1="-1.3716" x2="-23.4696" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-24.8412" y1="1.143" x2="-24.8412" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-5.5118" y1="1.143" x2="-5.5118" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-4.1402" y1="-1.397" x2="-4.1402" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-2.7686" y1="1.143" x2="-2.7686" y2="0.127" width="0.8128" layer="51"/>
<wire x1="0" y1="1.143" x2="0" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-1.3716" y1="-1.397" x2="-1.3716" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="1.3716" y1="-1.397" x2="1.3716" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="4.1402" y1="-1.397" x2="4.1402" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="2.7686" y1="1.143" x2="2.7686" y2="0.127" width="0.8128" layer="51"/>
<wire x1="5.5118" y1="1.143" x2="5.5118" y2="0.127" width="0.8128" layer="51"/>
<wire x1="8.2804" y1="1.143" x2="8.2804" y2="0.127" width="0.8128" layer="51"/>
<wire x1="6.9088" y1="-1.397" x2="6.9088" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="9.652" y1="-1.397" x2="9.652" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-27.305" y1="-17.526" x2="-27.559" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-17.526" x2="-27.305" y2="-17.526" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<pad name="19" x="24.8412" y="1.27" drill="1.016" shape="octagon"/>
<pad name="18" x="22.0726" y="1.27" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="13.7922" y="1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="1.27" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9324" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="32" x="9.652" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.8176" y="1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="1.27" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9578" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.098" y="1.27" drill="1.016" shape="octagon"/>
<pad name="1" x="-24.8412" y="1.27" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="-1.27" drill="1.016" shape="octagon"/>
<text x="-34.671" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-26.035" y="-20.447" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-26.924" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="26.162" y="0.635" size="1.27" layer="21" ratio="10">19</text>
<text x="-28.067" y="-2.032" size="1.27" layer="21" ratio="10">20</text>
<text x="25.908" y="-1.905" size="1.27" layer="21" ratio="10">37</text>
<text x="-32.893" y="-6.858" size="1.27" layer="21" ratio="10" rot="R90">2,54</text>
<text x="-26.924" y="-9.779" size="1.27" layer="21" ratio="10">M37</text>
<rectangle x1="-28.575" y1="-7.62" x2="28.575" y2="-6.858" layer="21"/>
<rectangle x1="-34.798" y1="-11.684" x2="34.798" y2="-11.176" layer="21"/>
<rectangle x1="-25.2476" y1="-6.8326" x2="-24.4348" y2="0.4064" layer="21"/>
<rectangle x1="-23.876" y1="-6.8326" x2="-23.0632" y2="-2.1336" layer="21"/>
<rectangle x1="-22.5044" y1="-6.8326" x2="-21.6916" y2="0.4064" layer="21"/>
<rectangle x1="-21.1074" y1="-6.8326" x2="-20.2946" y2="-2.1336" layer="21"/>
<rectangle x1="-19.7358" y1="-6.8326" x2="-18.923" y2="0.4064" layer="21"/>
<rectangle x1="-18.3642" y1="-6.8326" x2="-17.5514" y2="-2.1336" layer="21"/>
<rectangle x1="-16.9672" y1="-6.8326" x2="-16.1544" y2="0.4064" layer="21"/>
<rectangle x1="-15.5956" y1="-6.8326" x2="-14.7828" y2="-2.1336" layer="21"/>
<rectangle x1="-14.224" y1="-6.858" x2="-13.4112" y2="0.381" layer="21"/>
<rectangle x1="-12.827" y1="-6.858" x2="-12.0142" y2="-2.159" layer="21"/>
<rectangle x1="-11.4554" y1="-6.858" x2="-10.6426" y2="0.381" layer="21"/>
<rectangle x1="-10.0584" y1="-6.858" x2="-9.2456" y2="-2.159" layer="21"/>
<rectangle x1="-8.6868" y1="-6.858" x2="-7.874" y2="0.381" layer="21"/>
<rectangle x1="-7.3152" y1="-6.858" x2="-6.5024" y2="-2.159" layer="21"/>
<rectangle x1="-5.9182" y1="-6.858" x2="-5.1054" y2="0.381" layer="21"/>
<rectangle x1="-4.5466" y1="-6.858" x2="-3.7338" y2="-2.159" layer="21"/>
<rectangle x1="-3.175" y1="-6.858" x2="-2.3622" y2="0.381" layer="21"/>
<rectangle x1="-1.778" y1="-6.858" x2="-0.9652" y2="-2.159" layer="21"/>
<rectangle x1="-0.4064" y1="-6.858" x2="0.4064" y2="0.381" layer="21"/>
<rectangle x1="0.9652" y1="-6.858" x2="1.778" y2="-2.159" layer="21"/>
<rectangle x1="2.3622" y1="-6.858" x2="3.175" y2="0.381" layer="21"/>
<rectangle x1="3.7338" y1="-6.858" x2="4.5466" y2="-2.159" layer="21"/>
<rectangle x1="5.1054" y1="-6.858" x2="5.9182" y2="0.381" layer="21"/>
<rectangle x1="6.5024" y1="-6.858" x2="7.3152" y2="-2.159" layer="21"/>
<rectangle x1="7.874" y1="-6.858" x2="8.6868" y2="0.381" layer="21"/>
<rectangle x1="9.2456" y1="-6.858" x2="10.0584" y2="-2.159" layer="21"/>
<rectangle x1="10.6426" y1="-6.858" x2="11.4554" y2="0.381" layer="21"/>
<rectangle x1="12.0142" y1="-6.858" x2="12.827" y2="-2.159" layer="21"/>
<rectangle x1="13.3858" y1="-6.858" x2="14.1986" y2="0.381" layer="21"/>
<rectangle x1="14.7828" y1="-6.858" x2="15.5956" y2="-2.159" layer="21"/>
<rectangle x1="16.1544" y1="-6.858" x2="16.9672" y2="0.381" layer="21"/>
<rectangle x1="17.526" y1="-6.858" x2="18.3388" y2="-2.159" layer="21"/>
<rectangle x1="18.923" y1="-6.858" x2="19.7358" y2="0.381" layer="21"/>
<rectangle x1="20.2946" y1="-6.858" x2="21.1074" y2="-2.159" layer="21"/>
<rectangle x1="21.6662" y1="-6.858" x2="22.479" y2="0.381" layer="21"/>
<rectangle x1="23.0632" y1="-6.858" x2="23.876" y2="-2.159" layer="21"/>
<rectangle x1="24.4348" y1="-6.858" x2="25.2476" y2="0.381" layer="21"/>
<hole x="31.75" y="0" drill="3.302"/>
<hole x="-31.75" y="0" drill="3.302"/>
</package>
<package name="M37HP">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="27.559" y1="-17.526" x2="27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.559" y1="-17.526" x2="28.067" y2="-17.018" width="0.1524" layer="21" curve="90"/>
<wire x1="-28.067" y1="-17.018" x2="-27.559" y2="-17.526" width="0.1524" layer="21" curve="90"/>
<wire x1="27.686" y1="-11.684" x2="27.686" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="27.686" y1="-11.684" x2="-27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-11.684" x2="-27.686" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="34.798" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.62" x2="34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-10.668" x2="32.258" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-10.668" x2="34.798" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-11.176" x2="34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-11.684" x2="-34.798" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-11.176" x2="-34.798" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-10.668" x2="-34.798" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-7.62" x2="-34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="32.258" y1="-10.414" x2="29.718" y2="-10.414" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-11.176" x2="32.258" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="32.258" y1="-11.176" x2="29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="32.258" y1="-10.668" x2="32.258" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="32.258" y1="-10.668" x2="32.258" y2="-10.414" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-10.414" x2="29.718" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-10.668" x2="29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-7.493" x2="29.718" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-7.493" x2="29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-10.668" x2="29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="29.591" y1="-10.668" x2="-29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="28.956" y1="-7.62" x2="29.591" y2="-8.255" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.718" y1="-7.62" x2="28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-7.62" x2="28.575" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="29.591" y1="-8.255" x2="29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-7.62" x2="28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-7.62" x2="-28.575" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-6.858" x2="-28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-7.62" x2="-28.575" y2="-6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-7.62" x2="-28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="-7.62" x2="-29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-7.493" x2="-34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="-10.668" x2="-32.258" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="-10.668" x2="-34.798" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="-11.176" x2="-34.798" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-10.414" x2="-32.258" y2="-10.414" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="-10.668" x2="-32.258" y2="-10.414" width="0.1524" layer="21"/>
<wire x1="29.718" y1="-11.176" x2="-29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-11.176" x2="-32.258" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-10.414" x2="-29.718" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-10.668" x2="-29.718" y2="-11.176" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-8.255" x2="-29.591" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-10.668" x2="-29.718" y2="-10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="-8.255" x2="-28.956" y2="-7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="34.163" y1="3.175" x2="34.798" y2="2.54" width="0.1524" layer="21"/>
<wire x1="34.798" y1="2.54" x2="34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="29.337" y1="3.175" x2="34.163" y2="3.175" width="0.1524" layer="21"/>
<wire x1="29.337" y1="3.175" x2="28.829" y2="2.667" width="0.1524" layer="21"/>
<wire x1="28.829" y1="2.667" x2="28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="2.667" x2="-28.829" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="2.667" x2="-29.337" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="3.175" x2="-34.29" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-34.29" y1="3.175" x2="-34.798" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="2.667" x2="-34.798" y2="-7.493" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="1.143" x2="-11.049" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-8.2804" y1="1.143" x2="-8.2804" y2="0.127" width="0.8128" layer="51"/>
<wire x1="11.049" y1="1.143" x2="11.049" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-6.9088" y1="-1.397" x2="-6.9088" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-9.652" y1="-1.397" x2="-9.652" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-12.4206" y1="-1.397" x2="-12.4206" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-13.8176" y1="1.143" x2="-13.8176" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-15.1892" y1="-1.397" x2="-15.1892" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-16.5608" y1="1.143" x2="-16.5608" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-13.335" y1="-13.97" x2="-11.049" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-13.97" x2="-11.049" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-16.256" x2="-11.43" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-16.256" x2="-11.43" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-14.351" x2="-12.954" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-14.351" x2="-12.954" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-16.256" x2="-13.335" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-16.256" x2="-13.335" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="-13.97" x2="-6.985" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-13.97" x2="-6.985" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-16.256" x2="-7.366" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-16.256" x2="-7.366" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-14.351" x2="-8.89" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-14.351" x2="-8.89" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-16.256" x2="-9.271" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="-16.256" x2="-9.271" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-13.97" x2="13.335" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-13.97" x2="13.335" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-16.256" x2="12.954" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-16.256" x2="12.954" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-14.351" x2="11.43" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-14.351" x2="11.43" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-16.256" x2="11.049" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-16.256" x2="11.049" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-7.493" x2="-29.718" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="-7.62" x2="-34.798" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-11.684" x2="-34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-28.067" y1="-12.319" x2="-28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="-28.702" y1="-11.684" x2="-28.067" y2="-12.319" width="0.1524" layer="21" curve="-90"/>
<wire x1="34.798" y1="-11.684" x2="27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.702" y2="-11.684" width="0.1524" layer="21" curve="-90"/>
<wire x1="-17.9578" y1="-1.3716" x2="-17.9578" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-19.3294" y1="1.1684" x2="-19.3294" y2="0.1524" width="0.8128" layer="51"/>
<wire x1="12.4206" y1="-1.397" x2="12.4206" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="13.7922" y1="1.143" x2="13.7922" y2="0.127" width="0.8128" layer="51"/>
<wire x1="15.1892" y1="-1.397" x2="15.1892" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="16.5608" y1="1.143" x2="16.5608" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-17.272" y1="-13.97" x2="-14.986" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-13.97" x2="-14.986" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-16.256" x2="-15.367" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-15.367" y1="-16.256" x2="-15.367" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-15.367" y1="-14.351" x2="-16.891" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-16.891" y1="-14.351" x2="-16.891" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-16.891" y1="-16.256" x2="-17.272" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-17.272" y1="-16.256" x2="-17.272" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-13.97" x2="17.272" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="17.272" y1="-13.97" x2="17.272" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="17.272" y1="-16.256" x2="16.891" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="16.891" y1="-16.256" x2="16.891" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="16.891" y1="-14.351" x2="15.367" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="15.367" y1="-14.351" x2="15.367" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="15.367" y1="-16.256" x2="14.986" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-16.256" x2="14.986" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="17.9324" y1="-1.397" x2="17.9324" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="19.3294" y1="1.143" x2="19.3294" y2="0.127" width="0.8128" layer="51"/>
<wire x1="22.0726" y1="1.143" x2="22.0726" y2="0.127" width="0.8128" layer="51"/>
<wire x1="20.701" y1="-1.397" x2="20.701" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="24.8412" y1="1.143" x2="24.8412" y2="0.127" width="0.8128" layer="51"/>
<wire x1="23.4696" y1="-1.397" x2="23.4696" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-22.098" y1="1.143" x2="-22.098" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-20.701" y1="-1.3716" x2="-20.701" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-23.4696" y1="-1.3716" x2="-23.4696" y2="-2.3876" width="0.8128" layer="51"/>
<wire x1="-24.8412" y1="1.143" x2="-24.8412" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-21.209" y1="-13.97" x2="-18.923" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-18.923" y1="-13.97" x2="-18.923" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-18.923" y1="-16.256" x2="-19.304" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-19.304" y1="-16.256" x2="-19.304" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-19.304" y1="-14.351" x2="-20.828" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-14.351" x2="-20.828" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-16.256" x2="-21.209" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-21.209" y1="-16.256" x2="-21.209" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="18.923" y1="-13.97" x2="21.209" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="21.209" y1="-13.97" x2="21.209" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="21.209" y1="-16.256" x2="20.828" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="20.828" y1="-16.256" x2="20.828" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="20.828" y1="-14.351" x2="19.304" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="19.304" y1="-14.351" x2="19.304" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="19.304" y1="-16.256" x2="18.923" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="18.923" y1="-16.256" x2="18.923" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-5.5118" y1="1.143" x2="-5.5118" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-4.1402" y1="-1.397" x2="-4.1402" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-2.7686" y1="1.143" x2="-2.7686" y2="0.127" width="0.8128" layer="51"/>
<wire x1="0" y1="1.143" x2="0" y2="0.127" width="0.8128" layer="51"/>
<wire x1="-1.3716" y1="-1.397" x2="-1.3716" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="1.3716" y1="-1.397" x2="1.3716" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="4.1402" y1="-1.397" x2="4.1402" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="2.7686" y1="1.143" x2="2.7686" y2="0.127" width="0.8128" layer="51"/>
<wire x1="5.5118" y1="1.143" x2="5.5118" y2="0.127" width="0.8128" layer="51"/>
<wire x1="8.2804" y1="1.143" x2="8.2804" y2="0.127" width="0.8128" layer="51"/>
<wire x1="6.9088" y1="-1.397" x2="6.9088" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="9.652" y1="-1.397" x2="9.652" y2="-2.413" width="0.8128" layer="51"/>
<wire x1="-5.08" y1="-13.97" x2="-2.794" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-13.97" x2="-2.794" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-16.256" x2="-3.175" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-16.256" x2="-3.175" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-14.351" x2="-4.699" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-14.351" x2="-4.699" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-16.256" x2="-5.08" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-16.256" x2="-5.08" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-13.97" x2="1.143" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-13.97" x2="1.143" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-16.256" x2="0.762" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-16.256" x2="0.762" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-14.351" x2="-0.762" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-14.351" x2="-0.762" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-16.256" x2="-1.143" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-16.256" x2="-1.143" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-13.97" x2="5.08" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-13.97" x2="5.08" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-16.256" x2="4.699" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-16.256" x2="4.699" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-14.351" x2="3.175" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-14.351" x2="3.175" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-16.256" x2="2.794" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-16.256" x2="2.794" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-13.97" x2="9.271" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="9.271" y1="-13.97" x2="9.271" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="9.271" y1="-16.256" x2="8.89" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-16.256" x2="8.89" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-14.351" x2="7.366" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-14.351" x2="7.366" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-16.256" x2="6.985" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-16.256" x2="6.985" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="-12.192" x2="-27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="-17.526" x2="-27.559" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-12.192" x2="27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-17.526" x2="-27.305" y2="-17.526" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<pad name="19" x="24.8412" y="1.27" drill="1.016" shape="octagon"/>
<pad name="18" x="22.0726" y="1.27" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="13.7922" y="1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="1.27" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9324" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="32" x="9.652" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.8176" y="1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="1.27" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9578" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.098" y="1.27" drill="1.016" shape="octagon"/>
<pad name="1" x="-24.8412" y="1.27" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="G1" x="-31.75" y="0" drill="3.302" diameter="5.08"/>
<pad name="G2" x="31.75" y="0" drill="3.302" diameter="5.08"/>
<text x="-34.671" y="4.445" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-26.035" y="-20.447" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-26.924" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="26.162" y="0.635" size="1.27" layer="21" ratio="10">19</text>
<text x="-28.067" y="-2.032" size="1.27" layer="21" ratio="10">20</text>
<text x="25.908" y="-1.905" size="1.27" layer="21" ratio="10">37</text>
<text x="-32.893" y="-6.858" size="1.27" layer="21" ratio="10" rot="R90">2,54</text>
<text x="-26.924" y="-9.779" size="1.27" layer="21" ratio="10">M37</text>
<rectangle x1="28.956" y1="-10.668" x2="29.21" y2="-8.255" layer="21"/>
<rectangle x1="-29.21" y1="-10.668" x2="-28.956" y2="-8.255" layer="21"/>
<rectangle x1="31.3182" y1="-7.62" x2="32.3342" y2="-5.969" layer="21"/>
<rectangle x1="-32.3342" y1="-7.62" x2="-31.3182" y2="-5.969" layer="21"/>
<rectangle x1="-28.575" y1="-7.62" x2="28.575" y2="-6.858" layer="21"/>
<rectangle x1="-34.798" y1="-11.684" x2="34.798" y2="-11.176" layer="21"/>
<rectangle x1="-25.2476" y1="-6.858" x2="-24.4348" y2="0.381" layer="21"/>
<rectangle x1="-23.876" y1="-6.858" x2="-23.0632" y2="-2.159" layer="21"/>
<rectangle x1="-22.5044" y1="-6.858" x2="-21.6916" y2="0.381" layer="21"/>
<rectangle x1="-21.1074" y1="-6.858" x2="-20.2946" y2="-2.159" layer="21"/>
<rectangle x1="-19.7358" y1="-6.858" x2="-18.923" y2="0.381" layer="21"/>
<rectangle x1="-18.3642" y1="-6.858" x2="-17.5514" y2="-2.159" layer="21"/>
<rectangle x1="-16.9672" y1="-6.858" x2="-16.1544" y2="0.381" layer="21"/>
<rectangle x1="-15.5956" y1="-6.858" x2="-14.7828" y2="-2.159" layer="21"/>
<rectangle x1="-16.9672" y1="-6.858" x2="-16.1544" y2="0.381" layer="21"/>
<rectangle x1="-15.5956" y1="-6.858" x2="-14.7828" y2="-2.159" layer="21"/>
<rectangle x1="-14.224" y1="-6.858" x2="-13.4112" y2="0.381" layer="21"/>
<rectangle x1="-12.827" y1="-6.858" x2="-12.0142" y2="-2.159" layer="21"/>
<rectangle x1="-11.4554" y1="-6.858" x2="-10.6426" y2="0.381" layer="21"/>
<rectangle x1="-10.0584" y1="-6.858" x2="-9.2456" y2="-2.159" layer="21"/>
<rectangle x1="-8.6868" y1="-6.858" x2="-7.874" y2="0.381" layer="21"/>
<rectangle x1="-7.3152" y1="-6.858" x2="-6.5024" y2="-2.159" layer="21"/>
<rectangle x1="-5.9182" y1="-6.858" x2="-5.1054" y2="0.381" layer="21"/>
<rectangle x1="-4.5466" y1="-6.858" x2="-3.7338" y2="-2.159" layer="21"/>
<rectangle x1="-3.175" y1="-6.858" x2="-2.3622" y2="0.381" layer="21"/>
<rectangle x1="-1.778" y1="-6.858" x2="-0.9652" y2="-2.159" layer="21"/>
<rectangle x1="-0.4064" y1="-6.858" x2="0.4064" y2="0.381" layer="21"/>
<rectangle x1="0.9652" y1="-6.858" x2="1.778" y2="-2.159" layer="21"/>
<rectangle x1="2.3622" y1="-6.858" x2="3.175" y2="0.381" layer="21"/>
<rectangle x1="3.7338" y1="-6.858" x2="4.5466" y2="-2.159" layer="21"/>
<rectangle x1="5.1054" y1="-6.858" x2="5.9182" y2="0.381" layer="21"/>
<rectangle x1="6.5024" y1="-6.858" x2="7.3152" y2="-2.159" layer="21"/>
<rectangle x1="7.874" y1="-6.858" x2="8.6868" y2="0.381" layer="21"/>
<rectangle x1="9.2456" y1="-6.858" x2="10.0584" y2="-2.159" layer="21"/>
<rectangle x1="10.6426" y1="-6.8326" x2="11.4554" y2="0.4064" layer="21"/>
<rectangle x1="12.0142" y1="-6.858" x2="12.827" y2="-2.159" layer="21"/>
<rectangle x1="13.3858" y1="-6.858" x2="14.1986" y2="0.381" layer="21"/>
<rectangle x1="14.7828" y1="-6.858" x2="15.5956" y2="-2.159" layer="21"/>
<rectangle x1="16.1544" y1="-6.858" x2="16.9672" y2="0.381" layer="21"/>
<rectangle x1="17.526" y1="-6.858" x2="18.3388" y2="-2.159" layer="21"/>
<rectangle x1="18.923" y1="-6.858" x2="19.7358" y2="0.381" layer="21"/>
<rectangle x1="20.2946" y1="-6.858" x2="21.1074" y2="-2.159" layer="21"/>
<rectangle x1="21.6662" y1="-6.858" x2="22.479" y2="0.381" layer="21"/>
<rectangle x1="23.0632" y1="-6.858" x2="23.876" y2="-2.159" layer="21"/>
<rectangle x1="24.4348" y1="-6.858" x2="25.2476" y2="0.381" layer="21"/>
</package>
<package name="M37V">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.8224" y1="-2.9464" x2="-27.6098" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="25.527" y1="-3.937" x2="26.8357" y2="-2.905" width="0.1524" layer="21" curve="76.489196"/>
<wire x1="26.289" y1="3.937" x2="27.6045" y2="2.3038" width="0.1524" layer="21" curve="-102.298925"/>
<wire x1="27.6098" y1="2.3114" x2="26.8224" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="3.937" x2="26.289" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-27.6091" y1="2.3268" x2="-26.289" y2="3.937" width="0.1524" layer="21" curve="-101.30773"/>
<wire x1="-26.8299" y1="-2.9295" x2="-25.527" y2="-3.937" width="0.1524" layer="21" curve="75.428151"/>
<wire x1="-25.527" y1="-3.937" x2="25.527" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.798" y1="5.588" x2="34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.464" y1="-6.223" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="4.318" x2="26.289" y2="4.318" width="0.1524" layer="21"/>
<wire x1="27.9908" y1="2.3114" x2="27.2288" y2="-2.8702" width="0.1524" layer="21"/>
<wire x1="26.289" y1="4.318" x2="27.983" y2="2.2521" width="0.1524" layer="21" curve="-101.297755"/>
<wire x1="-27.2034" y1="-2.9464" x2="-27.9908" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="-27.9827" y1="2.2521" x2="-26.289" y2="4.318" width="0.1524" layer="21" curve="-101.307706"/>
<wire x1="-25.527" y1="-4.318" x2="25.527" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-27.239" y1="-2.8191" x2="-25.527" y2="-4.318" width="0.1524" layer="21" curve="82.402958"/>
<wire x1="25.527" y1="-4.318" x2="27.2513" y2="-2.6849" width="0.1524" layer="21" curve="86.865803"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="-2.7686" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-4.1402" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-5.5118" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="0" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-1.3716" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="1.3716" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="2.7686" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="5.5118" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="4.1402" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="6.9088" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="8.2804" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="9.652" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="11.049" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="12.4206" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="13.7922" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="16.5608" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="15.1892" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-8.2804" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-6.9088" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-9.652" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-11.049" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-13.7922" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-16.5608" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-12.4206" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-15.1892" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="19.3294" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="22.0726" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="24.8412" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="17.9324" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="20.701" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="23.4696" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-19.3294" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-22.0726" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-24.8412" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-17.9324" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-20.701" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-23.4696" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<pad name="19" x="24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="22.0726" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="13.7922" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9324" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.8176" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9578" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.098" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="1" x="-24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<text x="-34.544" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-25.0444" y="2.413" size="0.9906" layer="21" ratio="12">1</text>
<text x="-22.3774" y="2.413" size="0.9906" layer="21" ratio="12">2</text>
<text x="-19.7104" y="2.413" size="0.9906" layer="21" ratio="12">3</text>
<text x="-17.0434" y="2.413" size="0.9906" layer="21" ratio="12">4</text>
<text x="-14.2494" y="2.413" size="0.9906" layer="21" ratio="12">5</text>
<text x="-11.4554" y="2.413" size="0.9906" layer="21" ratio="12">6</text>
<text x="-8.6614" y="2.413" size="0.9906" layer="21" ratio="12">7</text>
<text x="-5.8674" y="2.413" size="0.9906" layer="21" ratio="12">8</text>
<text x="-3.2004" y="2.413" size="0.9906" layer="21" ratio="12">9</text>
<text x="-0.6604" y="2.413" size="0.9906" layer="21" ratio="12">10</text>
<text x="2.0066" y="2.413" size="0.9906" layer="21" ratio="12">11</text>
<text x="4.6736" y="2.413" size="0.9906" layer="21" ratio="12">12</text>
<text x="7.5946" y="2.413" size="0.9906" layer="21" ratio="12">13</text>
<text x="10.2616" y="2.413" size="0.9906" layer="21" ratio="12">14</text>
<text x="13.0556" y="2.413" size="0.9906" layer="21" ratio="12">15</text>
<text x="15.8496" y="2.413" size="0.9906" layer="21" ratio="12">16</text>
<text x="18.5166" y="2.413" size="0.9906" layer="21" ratio="12">17</text>
<text x="21.1836" y="2.413" size="0.9906" layer="21" ratio="12">18</text>
<text x="24.1046" y="2.413" size="0.9906" layer="21" ratio="12">19</text>
<text x="-24.3332" y="-3.429" size="0.9906" layer="21" ratio="12">20</text>
<text x="-21.5392" y="-3.429" size="0.9906" layer="21" ratio="12">21</text>
<text x="-18.7452" y="-3.429" size="0.9906" layer="21" ratio="12">22</text>
<text x="-15.9512" y="-3.429" size="0.9906" layer="21" ratio="12">23</text>
<text x="-13.2842" y="-3.429" size="0.9906" layer="21" ratio="12">24</text>
<text x="-10.4902" y="-3.429" size="0.9906" layer="21" ratio="12">25</text>
<text x="-7.747" y="-3.429" size="0.9906" layer="21" ratio="12">26</text>
<text x="-4.953" y="-3.429" size="0.9906" layer="21" ratio="12">27</text>
<text x="-2.286" y="-3.429" size="0.9906" layer="21" ratio="12">28</text>
<text x="0.508" y="-3.429" size="0.9906" layer="21" ratio="12">29</text>
<text x="3.302" y="-3.429" size="0.9906" layer="21" ratio="12">30</text>
<text x="6.096" y="-3.429" size="0.9906" layer="21" ratio="12">31</text>
<text x="8.763" y="-3.429" size="0.9906" layer="21" ratio="12">32</text>
<text x="11.557" y="-3.429" size="0.9906" layer="21" ratio="12">33</text>
<text x="14.351" y="-3.429" size="0.9906" layer="21" ratio="12">34</text>
<text x="17.145" y="-3.429" size="0.9906" layer="21" ratio="12">35</text>
<text x="19.812" y="-3.429" size="0.9906" layer="21" ratio="12">36</text>
<text x="22.606" y="-3.429" size="0.9906" layer="21" ratio="12">37</text>
<hole x="31.75" y="0" drill="3.302"/>
<hole x="-31.75" y="0" drill="3.302"/>
</package>
<package name="M37VP">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.8224" y1="-2.9464" x2="-27.6098" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="25.527" y1="-3.937" x2="26.8357" y2="-2.905" width="0.1524" layer="21" curve="76.489196"/>
<wire x1="26.289" y1="3.937" x2="27.6045" y2="2.3038" width="0.1524" layer="21" curve="-102.298925"/>
<wire x1="27.6098" y1="2.3114" x2="26.8224" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="3.937" x2="26.289" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-27.6091" y1="2.3268" x2="-26.289" y2="3.937" width="0.1524" layer="21" curve="-101.30773"/>
<wire x1="-26.8299" y1="-2.9295" x2="-25.527" y2="-3.937" width="0.1524" layer="21" curve="75.428151"/>
<wire x1="-25.527" y1="-3.937" x2="25.527" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.798" y1="5.588" x2="34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.464" y1="-6.223" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="4.318" x2="26.289" y2="4.318" width="0.1524" layer="21"/>
<wire x1="27.9908" y1="2.3114" x2="27.2288" y2="-2.8702" width="0.1524" layer="21"/>
<wire x1="26.289" y1="4.318" x2="27.983" y2="2.2521" width="0.1524" layer="21" curve="-101.297755"/>
<wire x1="-27.2034" y1="-2.9464" x2="-27.9908" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="-27.9827" y1="2.2521" x2="-26.289" y2="4.318" width="0.1524" layer="21" curve="-101.307706"/>
<wire x1="-25.527" y1="-4.318" x2="25.527" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-27.239" y1="-2.8191" x2="-25.527" y2="-4.318" width="0.1524" layer="21" curve="82.402958"/>
<wire x1="25.527" y1="-4.318" x2="27.2513" y2="-2.6849" width="0.1524" layer="21" curve="86.865803"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="-2.7686" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-4.1402" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-5.5118" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="0" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-1.3716" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="1.3716" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="2.7686" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="5.5118" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="4.1402" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="6.9088" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="8.2804" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="9.652" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="11.049" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="12.4206" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="13.7922" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="16.5608" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="15.1892" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-8.2804" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-6.9088" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-9.652" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-11.049" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-13.7922" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-16.5608" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-12.4206" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-15.1892" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="19.3294" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="22.0726" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="24.8412" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="17.9324" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="20.701" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="23.4696" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-19.3294" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-22.0726" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-24.8412" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-17.9324" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-20.701" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-23.4696" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<pad name="19" x="24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="22.0726" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="13.7922" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9324" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.8176" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9578" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.098" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="1" x="-24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="G1" x="-31.75" y="0" drill="3.302" diameter="5.08"/>
<pad name="G2" x="31.75" y="0" drill="3.302" diameter="5.08"/>
<text x="-34.544" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-25.0444" y="2.413" size="0.9906" layer="21" ratio="12">1</text>
<text x="-22.3774" y="2.413" size="0.9906" layer="21" ratio="12">2</text>
<text x="-19.7104" y="2.413" size="0.9906" layer="21" ratio="12">3</text>
<text x="-17.0434" y="2.413" size="0.9906" layer="21" ratio="12">4</text>
<text x="-14.2494" y="2.413" size="0.9906" layer="21" ratio="12">5</text>
<text x="-11.4554" y="2.413" size="0.9906" layer="21" ratio="12">6</text>
<text x="-8.6614" y="2.413" size="0.9906" layer="21" ratio="12">7</text>
<text x="-5.8674" y="2.413" size="0.9906" layer="21" ratio="12">8</text>
<text x="-3.2004" y="2.413" size="0.9906" layer="21" ratio="12">9</text>
<text x="-0.6604" y="2.413" size="0.9906" layer="21" ratio="12">10</text>
<text x="2.0066" y="2.413" size="0.9906" layer="21" ratio="12">11</text>
<text x="4.6736" y="2.413" size="0.9906" layer="21" ratio="12">12</text>
<text x="7.5946" y="2.413" size="0.9906" layer="21" ratio="12">13</text>
<text x="10.2616" y="2.413" size="0.9906" layer="21" ratio="12">14</text>
<text x="13.0556" y="2.413" size="0.9906" layer="21" ratio="12">15</text>
<text x="15.8496" y="2.413" size="0.9906" layer="21" ratio="12">16</text>
<text x="18.5166" y="2.413" size="0.9906" layer="21" ratio="12">17</text>
<text x="21.1836" y="2.413" size="0.9906" layer="21" ratio="12">18</text>
<text x="24.1046" y="2.413" size="0.9906" layer="21" ratio="12">19</text>
<text x="-24.3332" y="-3.429" size="0.9906" layer="21" ratio="12">20</text>
<text x="-21.5392" y="-3.429" size="0.9906" layer="21" ratio="12">21</text>
<text x="-18.7452" y="-3.429" size="0.9906" layer="21" ratio="12">22</text>
<text x="-15.9512" y="-3.429" size="0.9906" layer="21" ratio="12">23</text>
<text x="-13.2842" y="-3.429" size="0.9906" layer="21" ratio="12">24</text>
<text x="-10.4902" y="-3.429" size="0.9906" layer="21" ratio="12">25</text>
<text x="-7.747" y="-3.429" size="0.9906" layer="21" ratio="12">26</text>
<text x="-4.953" y="-3.429" size="0.9906" layer="21" ratio="12">27</text>
<text x="-2.286" y="-3.429" size="0.9906" layer="21" ratio="12">28</text>
<text x="0.508" y="-3.429" size="0.9906" layer="21" ratio="12">29</text>
<text x="3.302" y="-3.429" size="0.9906" layer="21" ratio="12">30</text>
<text x="6.096" y="-3.429" size="0.9906" layer="21" ratio="12">31</text>
<text x="8.763" y="-3.429" size="0.9906" layer="21" ratio="12">32</text>
<text x="11.557" y="-3.429" size="0.9906" layer="21" ratio="12">33</text>
<text x="14.351" y="-3.429" size="0.9906" layer="21" ratio="12">34</text>
<text x="17.145" y="-3.429" size="0.9906" layer="21" ratio="12">35</text>
<text x="19.812" y="-3.429" size="0.9906" layer="21" ratio="12">36</text>
<text x="22.606" y="-3.429" size="0.9906" layer="21" ratio="12">37</text>
</package>
<package name="M37VB">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="26.8224" y1="2.9464" x2="27.6098" y2="-2.3368" width="0.1524" layer="21"/>
<wire x1="-26.8357" y1="2.905" x2="-25.527" y2="3.937" width="0.1524" layer="21" curve="-76.489196"/>
<wire x1="-27.6045" y1="-2.3038" x2="-26.289" y2="-3.937" width="0.1524" layer="21" curve="102.298925"/>
<wire x1="-27.6098" y1="-2.3114" x2="-26.8224" y2="2.921" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-3.937" x2="-26.289" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-3.937" x2="27.6091" y2="-2.3268" width="0.1524" layer="21" curve="101.30773"/>
<wire x1="25.527" y1="3.937" x2="26.8299" y2="2.9295" width="0.1524" layer="21" curve="-75.428151"/>
<wire x1="25.527" y1="3.937" x2="-25.527" y2="3.937" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.798" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.798" y1="-5.588" x2="34.798" y2="5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-29.464" y1="6.223" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-4.318" x2="-26.289" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-27.9908" y1="-2.3114" x2="-27.2288" y2="2.8702" width="0.1524" layer="21"/>
<wire x1="-27.983" y1="-2.2521" x2="-26.289" y2="-4.318" width="0.1524" layer="21" curve="101.297755"/>
<wire x1="27.2034" y1="2.9464" x2="27.9908" y2="-2.3368" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-4.318" x2="27.9827" y2="-2.2521" width="0.1524" layer="21" curve="101.307706"/>
<wire x1="25.527" y1="4.318" x2="-25.527" y2="4.318" width="0.1524" layer="21"/>
<wire x1="25.527" y1="4.318" x2="27.239" y2="2.8191" width="0.1524" layer="21" curve="-82.402958"/>
<wire x1="-27.2513" y1="2.6849" x2="-25.527" y2="4.318" width="0.1524" layer="21" curve="-86.865803"/>
<circle x="2.7686" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="4.1402" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="5.5118" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="0" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="1.3716" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-1.3716" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-2.7686" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-5.5118" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-4.1402" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-6.9088" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-8.2804" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-9.652" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-11.049" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-12.4206" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-13.7922" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-16.5608" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-15.1892" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="8.2804" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="6.9088" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="9.652" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="11.049" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="13.7922" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="16.5608" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="12.4206" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="15.1892" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-19.3294" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-22.0726" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-24.8412" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-17.9324" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-20.701" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="-23.4696" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="19.3294" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="22.0726" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="24.8412" y="-1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="17.9324" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="20.701" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<circle x="23.4696" y="1.4224" radius="0.254" width="0.4064" layer="51"/>
<pad name="19" x="-24.8412" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="-22.0726" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="-19.3294" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="-16.5608" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="-13.7922" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="-11.049" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="-8.2804" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="-5.5118" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="-2.7686" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="2.7686" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="5.5118" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="8.2804" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="-23.4696" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="-20.701" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="-17.9324" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="-15.1892" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="-12.4206" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="-9.652" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="-6.9088" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="-4.1402" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="-1.3716" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="1.3716" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="4.1402" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="6.9088" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="11.049" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="13.8176" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="16.5608" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="19.3294" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="9.652" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="12.4206" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="15.1892" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="17.9578" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="22.098" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="1" x="24.8412" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="20.701" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="23.4696" y="1.4224" drill="1.016" shape="octagon"/>
<text x="-34.544" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="25.0444" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">1</text>
<text x="22.3774" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">2</text>
<text x="19.7104" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">3</text>
<text x="17.0434" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">4</text>
<text x="14.2494" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">5</text>
<text x="11.4554" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">6</text>
<text x="8.6614" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">7</text>
<text x="5.8674" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">8</text>
<text x="3.2004" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">9</text>
<text x="0.6604" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">10</text>
<text x="-2.0066" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">11</text>
<text x="-4.6736" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">12</text>
<text x="-7.5946" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">13</text>
<text x="-10.2616" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">14</text>
<text x="-13.0556" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">15</text>
<text x="-15.8496" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">16</text>
<text x="-18.5166" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">17</text>
<text x="-21.1836" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">18</text>
<text x="-24.1046" y="-2.413" size="0.9906" layer="21" ratio="12" rot="R180">19</text>
<text x="24.3332" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">20</text>
<text x="21.5392" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">21</text>
<text x="18.7452" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">22</text>
<text x="15.9512" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">23</text>
<text x="13.2842" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">24</text>
<text x="10.4902" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">25</text>
<text x="7.747" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">26</text>
<text x="4.953" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">27</text>
<text x="2.286" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">28</text>
<text x="-0.508" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">29</text>
<text x="-3.302" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">30</text>
<text x="-6.096" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">31</text>
<text x="-8.763" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">32</text>
<text x="-11.557" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">33</text>
<text x="-14.351" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">34</text>
<text x="-17.145" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">35</text>
<text x="-19.812" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">36</text>
<text x="-22.606" y="3.429" size="0.9906" layer="21" ratio="12" rot="R180">37</text>
</package>
<package name="182-037-MALE">
<description>&lt;b&gt;NORCOMP Right Angle D-Sub Connector&lt;/b&gt;, 182 Economy Series (.318" Footprint)&lt;p&gt;
Source: http://www.norcomp.net/ .. 182-yyy-113Ryy1Rev3.pdf</description>
<wire x1="27.6352" y1="-5.751" x2="28.1432" y2="-5.243" width="0.1524" layer="21" curve="90"/>
<wire x1="-28.1432" y1="-5.243" x2="-27.6352" y2="-5.751" width="0.1524" layer="21" curve="90"/>
<wire x1="34.8742" y1="12.875" x2="34.8742" y2="2.885" width="0.1524" layer="21"/>
<wire x1="34.8742" y1="2.885" x2="34.8742" y2="0.091" width="0.1524" layer="21"/>
<wire x1="-34.8742" y1="12.875" x2="-34.8742" y2="0.091" width="0.1524" layer="21"/>
<wire x1="34.8742" y1="0.091" x2="-34.8742" y2="0.091" width="0.1524" layer="21"/>
<wire x1="-28.1432" y1="-0.544" x2="-28.1432" y2="-5.243" width="0.1524" layer="21"/>
<wire x1="-28.7782" y1="0.091" x2="-28.1432" y2="-0.544" width="0.1524" layer="21" curve="-90"/>
<wire x1="28.1432" y1="-0.544" x2="28.1432" y2="-5.243" width="0.1524" layer="21"/>
<wire x1="28.1432" y1="-0.544" x2="28.7782" y2="0.091" width="0.1524" layer="21" curve="-90"/>
<wire x1="27.6352" y1="-5.751" x2="-27.6352" y2="-5.751" width="0.1524" layer="21"/>
<wire x1="34.8742" y1="2.885" x2="-34.8742" y2="2.885" width="0.1524" layer="21"/>
<wire x1="-28.9052" y1="12.875" x2="-28.9052" y2="3.082" width="0.1524" layer="21"/>
<wire x1="28.9052" y1="3.082" x2="28.9052" y2="12.875" width="0.1524" layer="21"/>
<wire x1="34.8742" y1="12.8926" x2="-34.8742" y2="12.8926" width="0.1524" layer="21"/>
<pad name="5" x="-13.843" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="4" x="-16.6116" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="3" x="-19.3802" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="2" x="-22.1488" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="1" x="-24.9174" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="6" x="-11.0744" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="7" x="-8.3058" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="8" x="-5.5372" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="9" x="-2.7686" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="10" x="0" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="11" x="2.7686" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="12" x="5.5372" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="13" x="8.3058" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="14" x="11.0744" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="15" x="13.843" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="16" x="16.6116" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="17" x="19.3802" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="18" x="22.1488" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="19" x="24.9174" y="10.9233" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="20" x="-23.5331" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="21" x="-20.7645" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="22" x="-17.9959" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="23" x="-15.2273" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="24" x="-12.4587" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="25" x="-9.6901" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="26" x="-6.9215" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="27" x="-4.1529" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="28" x="-1.3843" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="29" x="1.3843" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="30" x="4.1529" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="31" x="6.9215" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="32" x="9.6901" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="33" x="12.4587" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="34" x="15.2273" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="35" x="17.9959" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="36" x="20.7645" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<pad name="37" x="23.5331" y="8.0797" drill="1.1938" diameter="1.524" shape="octagon"/>
<text x="-28.6258" y="13.335" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-17.1958" y="13.335" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-27.0002" y="9.9782" size="1.27" layer="21" ratio="10">1</text>
<text x="-27.0002" y="7.3112" size="1.27" layer="21" ratio="10">20</text>
<hole x="-31.8262" y="9.5009" drill="3.048"/>
<hole x="31.8262" y="9.5009" drill="3.048"/>
</package>
<package name="M37SMT">
<description>&lt;b&gt;D-Sub Steckverbinder&lt;/b&gt; Abgewinkelte Messerleisten SMT, Einbauhöhe 3,6mm&lt;p&gt;
Source: ERNI-D-Sub-Conmnectors-d.pdf / www.erni.com</description>
<wire x1="27.559" y1="-17.526" x2="27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.559" y1="-17.526" x2="28.067" y2="-17.018" width="0.1524" layer="21" curve="90"/>
<wire x1="-28.067" y1="-17.018" x2="-27.559" y2="-17.526" width="0.1524" layer="21" curve="90"/>
<wire x1="27.686" y1="-11.684" x2="27.686" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="27.686" y1="-11.684" x2="-27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-11.684" x2="-27.686" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-8.92" x2="28.575" y2="-8.92" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-8.92" x2="34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-8.92" x2="34.75" y2="-8.793" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-11.684" x2="-34.798" y2="-8.92" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-8.92" x2="-34.75" y2="-8.793" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-8.92" x2="28.575" y2="-8.158" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-8.92" x2="-28.575" y2="-8.92" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-8.158" x2="-28.575" y2="-8.158" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-8.92" x2="-28.575" y2="-8.158" width="0.1524" layer="21"/>
<wire x1="34.75" y1="3.016" x2="34.75" y2="-8.793" width="0.1524" layer="21"/>
<wire x1="-34.75" y1="3.016" x2="-34.75" y2="-8.793" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-13.97" x2="-11.049" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-13.97" x2="-11.049" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-16.256" x2="-11.43" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-16.256" x2="-11.43" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-14.351" x2="-12.954" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-14.351" x2="-12.954" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-12.954" y1="-16.256" x2="-13.335" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-16.256" x2="-13.335" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="-13.97" x2="-6.985" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-13.97" x2="-6.985" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-16.256" x2="-7.366" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-16.256" x2="-7.366" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-7.366" y1="-14.351" x2="-8.89" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-14.351" x2="-8.89" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-16.256" x2="-9.271" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-9.271" y1="-16.256" x2="-9.271" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-13.97" x2="13.335" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-13.97" x2="13.335" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-16.256" x2="12.954" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-16.256" x2="12.954" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="12.954" y1="-14.351" x2="11.43" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-14.351" x2="11.43" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="11.43" y1="-16.256" x2="11.049" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-16.256" x2="11.049" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="-8.92" x2="-34.798" y2="-8.92" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-11.684" x2="-34.798" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="-28.067" y1="-12.319" x2="-28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="-28.702" y1="-11.684" x2="-28.067" y2="-12.319" width="0.1524" layer="21" curve="-90"/>
<wire x1="34.798" y1="-11.684" x2="27.686" y2="-11.684" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.067" y2="-17.018" width="0.1524" layer="21"/>
<wire x1="28.067" y1="-12.319" x2="28.702" y2="-11.684" width="0.1524" layer="21" curve="-90"/>
<wire x1="-17.272" y1="-13.97" x2="-14.986" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-13.97" x2="-14.986" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-14.986" y1="-16.256" x2="-15.367" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-15.367" y1="-16.256" x2="-15.367" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-15.367" y1="-14.351" x2="-16.891" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-16.891" y1="-14.351" x2="-16.891" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-16.891" y1="-16.256" x2="-17.272" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-17.272" y1="-16.256" x2="-17.272" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-13.97" x2="17.272" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="17.272" y1="-13.97" x2="17.272" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="17.272" y1="-16.256" x2="16.891" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="16.891" y1="-16.256" x2="16.891" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="16.891" y1="-14.351" x2="15.367" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="15.367" y1="-14.351" x2="15.367" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="15.367" y1="-16.256" x2="14.986" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="14.986" y1="-16.256" x2="14.986" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-21.209" y1="-13.97" x2="-18.923" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-18.923" y1="-13.97" x2="-18.923" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-18.923" y1="-16.256" x2="-19.304" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-19.304" y1="-16.256" x2="-19.304" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-19.304" y1="-14.351" x2="-20.828" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-14.351" x2="-20.828" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-16.256" x2="-21.209" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-21.209" y1="-16.256" x2="-21.209" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="18.923" y1="-13.97" x2="21.209" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="21.209" y1="-13.97" x2="21.209" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="21.209" y1="-16.256" x2="20.828" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="20.828" y1="-16.256" x2="20.828" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="20.828" y1="-14.351" x2="19.304" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="19.304" y1="-14.351" x2="19.304" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="19.304" y1="-16.256" x2="18.923" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="18.923" y1="-16.256" x2="18.923" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-13.97" x2="-2.794" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-13.97" x2="-2.794" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-16.256" x2="-3.175" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-16.256" x2="-3.175" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-14.351" x2="-4.699" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-14.351" x2="-4.699" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-16.256" x2="-5.08" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-16.256" x2="-5.08" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-13.97" x2="1.143" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-13.97" x2="1.143" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-16.256" x2="0.762" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-16.256" x2="0.762" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-14.351" x2="-0.762" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-14.351" x2="-0.762" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-16.256" x2="-1.143" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-16.256" x2="-1.143" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-13.97" x2="5.08" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-13.97" x2="5.08" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-16.256" x2="4.699" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-16.256" x2="4.699" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-14.351" x2="3.175" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-14.351" x2="3.175" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-16.256" x2="2.794" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-16.256" x2="2.794" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-13.97" x2="9.271" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="9.271" y1="-13.97" x2="9.271" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="9.271" y1="-16.256" x2="8.89" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-16.256" x2="8.89" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-14.351" x2="7.366" y2="-14.351" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-14.351" x2="7.366" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="7.366" y1="-16.256" x2="6.985" y2="-16.256" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-16.256" x2="6.985" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="-12.192" x2="-27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="-27.305" y1="-17.526" x2="-27.559" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-12.192" x2="27.305" y2="-17.526" width="0.1524" layer="21"/>
<wire x1="27.305" y1="-17.526" x2="-27.305" y2="-17.526" width="0.1524" layer="21"/>
<text x="21.59" y="5.715" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-30.7975" y="5.715" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-27.94" y="3.4925" size="1.27" layer="21" ratio="10">19</text>
<text x="26.3525" y="3.4925" size="1.27" layer="21" ratio="10">1</text>
<text x="-26.9875" y="-2.54" size="1.27" layer="21" ratio="10">37</text>
<text x="25.0825" y="-2.2225" size="1.27" layer="21" ratio="10">20</text>
<text x="-26.599" y="-15.104" size="1.27" layer="21" ratio="10">M37</text>
<rectangle x1="-28.575" y1="-8.92" x2="28.575" y2="-8.158" layer="21"/>
<rectangle x1="-34.798" y1="-11.684" x2="34.798" y2="-11.176" layer="21"/>
<hole x="-30.85" y="0" drill="1.7"/>
<hole x="30.85" y="0" drill="1.7"/>
<smd name="1" x="24.84" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="20" x="23.46" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="2" x="22.08" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="3" x="19.32" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="4" x="16.56" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="5" x="13.8" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="6" x="11.04" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="7" x="8.28" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="8" x="5.52" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="9" x="2.76" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="10" x="0" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="11" x="-2.76" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="12" x="-5.52" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="13" x="-8.28" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="14" x="-11.04" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="15" x="-13.8" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="16" x="-16.56" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="17" x="-19.32" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="18" x="-22.08" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="19" x="-24.84" y="1.975" dx="1" dy="2.8" layer="1"/>
<smd name="21" x="20.7" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="22" x="17.94" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="23" x="15.18" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="24" x="12.42" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="25" x="9.66" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="26" x="6.9" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="27" x="4.14" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="28" x="1.38" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="29" x="-1.38" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="30" x="-4.14" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="31" x="-6.9" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="32" x="-9.66" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="33" x="-12.42" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="34" x="-15.18" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="35" x="-17.94" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="36" x="-20.7" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="37" x="-23.46" y="-1.975" dx="1" dy="2.8" layer="1"/>
<smd name="S@2" x="-31.725" y="-2.625" dx="1" dy="1" layer="1"/>
<smd name="S@1" x="31.725" y="-2.65" dx="1" dy="1" layer="1"/>
<wire x1="-34.9275" y1="-8.1" x2="34.9275" y2="-8.1" width="0" layer="20"/>
<polygon width="0.2" layer="1">
<vertex x="-34.6075" y="-7.9375"/>
<vertex x="-28.8" y="-7.9375"/>
<vertex x="-28.8" y="-1.5875"/>
<vertex x="-30.7975" y="-1.5875" curve="-180"/>
<vertex x="-30.7975" y="1.5875"/>
<vertex x="-28.775" y="1.5875"/>
<vertex x="-28.775" y="3.325"/>
<vertex x="-34.6075" y="3.325"/>
</polygon>
<polygon width="0.2" layer="1">
<vertex x="34.6075" y="-7.9375"/>
<vertex x="28.8" y="-7.9375"/>
<vertex x="28.8" y="-1.5875"/>
<vertex x="30.7975" y="-1.5875" curve="180"/>
<vertex x="30.7975" y="1.5875"/>
<vertex x="28.775" y="1.5875"/>
<vertex x="28.775" y="3.325"/>
<vertex x="34.6075" y="3.325"/>
</polygon>
<wire x1="34.75" y1="3.016" x2="-34.75" y2="3.016" width="0.1524" layer="21"/>
</package>
<package name="F37D">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-27.4066" y1="6.9342" x2="-26.8986" y2="7.4422" width="0.1524" layer="21" curve="-90"/>
<wire x1="26.7716" y1="7.4422" x2="27.2796" y2="6.9342" width="0.1524" layer="21" curve="-90"/>
<wire x1="-27.4066" y1="1.8542" x2="-27.4066" y2="6.9342" width="0.1524" layer="21"/>
<wire x1="-28.0416" y1="1.2192" x2="-27.4066" y2="1.8542" width="0.1524" layer="21" curve="90"/>
<wire x1="27.2796" y1="1.8542" x2="27.2796" y2="6.9342" width="0.1524" layer="21"/>
<wire x1="27.2796" y1="1.8542" x2="27.9146" y2="1.2192" width="0.1524" layer="21" curve="90"/>
<wire x1="-26.8986" y1="7.4422" x2="26.7716" y2="7.4422" width="0.1524" layer="21"/>
<wire x1="-26.8732" y1="0.508" x2="-26.8732" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-26.8732" y1="0.508" x2="-26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-26.7462" y1="-1.905" x2="-26.1112" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-26.7462" y1="-1.905" x2="-26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-26.13" y1="-2.54" x2="26.13" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="26.8732" y1="0.508" x2="26.8732" y2="1.016" width="0.1524" layer="21"/>
<wire x1="26.7462" y1="-1.905" x2="26.7462" y2="0.508" width="0.1524" layer="21"/>
<wire x1="26.7462" y1="0.508" x2="26.8732" y2="0.508" width="0.1524" layer="21"/>
<wire x1="26.1112" y1="-2.54" x2="26.7462" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="-32.9184" y1="-2.7432" x2="-31.5468" y2="-4.1148" width="0" layer="48"/>
<wire x1="-31.5468" y1="-4.1148" x2="-30.1752" y2="-2.7432" width="0" layer="48"/>
<wire x1="-30.1752" y1="-2.7432" x2="-28.8036" y2="-4.1148" width="0" layer="48"/>
<wire x1="-28.8036" y1="-4.1148" x2="-27.432" y2="-2.7432" width="0" layer="48"/>
<wire x1="27.432" y1="-2.7432" x2="28.8036" y2="-4.1148" width="0" layer="48"/>
<wire x1="28.8036" y1="-4.1148" x2="30.1752" y2="-2.7432" width="0" layer="48"/>
<wire x1="30.1752" y1="-2.7432" x2="31.5468" y2="-4.1148" width="0" layer="48"/>
<wire x1="31.5468" y1="-4.1148" x2="32.9184" y2="-2.7432" width="0" layer="48"/>
<smd name="1" x="-24.689" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="2" x="-21.9458" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="3" x="-19.2022" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="4" x="-16.4594" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="5" x="-13.716" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="20" x="-23.3172" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="6" x="-10.9726" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="7" x="-8.2298" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="8" x="-5.4862" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="9" x="-2.7434" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="10" x="0" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="11" x="2.7434" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="12" x="5.4862" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="13" x="8.2298" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="14" x="10.9726" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="15" x="13.716" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="16" x="16.4594" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="17" x="19.2022" y="-6.0448" dx="1.7" dy="3.5" layer="1"/>
<smd name="18" x="21.9458" y="-6.0446" dx="1.7" dy="3.5" layer="1"/>
<smd name="19" x="24.689" y="-6.045" dx="1.7" dy="3.5" layer="1"/>
<smd name="21" x="-20.574" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="22" x="-17.8308" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="23" x="-15.0876" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="24" x="-12.3444" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="25" x="-9.6012" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="26" x="-6.858" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="27" x="-4.1148" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="28" x="-1.3716" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="29" x="1.3716" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="30" x="4.1148" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="31" x="6.858" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="32" x="9.6012" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="33" x="12.3444" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="34" x="15.0876" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="35" x="17.8308" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="36" x="20.574" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<smd name="37" x="23.3172" y="-6.0452" dx="1.7" dy="3.5" layer="16"/>
<text x="-10.2616" y="-10.16" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.1016" y="-10.16" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-25.0224" y="-2.2786" size="1.27" layer="21" ratio="10">1</text>
<text x="27.8892" y="-2.54" size="1.27" layer="48">Board</text>
<text x="-25.4508" y="4.5974" size="1.27" layer="51" ratio="10">F37D</text>
<text x="23.8874" y="-2.1786" size="1.27" layer="21" ratio="10">19</text>
<text x="-22.1792" y="-0.7966" size="1.27" layer="22" ratio="10" rot="MR0">20</text>
<text x="24.1442" y="-0.6966" size="1.27" layer="22" ratio="10" rot="MR0">37</text>
<text x="-32.9692" y="-2.54" size="1.27" layer="48">Board </text>
<rectangle x1="-19.685" y1="0.8112" x2="19.558" y2="1.3192" layer="21"/>
<rectangle x1="-25.2888" y1="-6.56" x2="-24.0888" y2="-4.06" layer="51"/>
<rectangle x1="-23.9172" y1="-6.56" x2="-22.7172" y2="-4.06" layer="52"/>
<rectangle x1="-21.174" y1="-6.56" x2="-19.974" y2="-4.06" layer="52"/>
<rectangle x1="-18.4308" y1="-6.56" x2="-17.2308" y2="-4.06" layer="52"/>
<rectangle x1="-22.5456" y1="-6.56" x2="-21.3456" y2="-4.06" layer="51"/>
<rectangle x1="-19.8024" y1="-6.56" x2="-18.6024" y2="-4.06" layer="51"/>
<rectangle x1="-17.0592" y1="-6.56" x2="-15.8592" y2="-4.06" layer="51"/>
<rectangle x1="-14.316" y1="-6.56" x2="-13.116" y2="-4.06" layer="51"/>
<rectangle x1="-15.6876" y1="-6.56" x2="-14.4876" y2="-4.06" layer="52"/>
<rectangle x1="-12.9444" y1="-6.56" x2="-11.7444" y2="-4.06" layer="52"/>
<rectangle x1="-10.2012" y1="-6.56" x2="-9.0012" y2="-4.06" layer="52"/>
<rectangle x1="-7.458" y1="-6.56" x2="-6.258" y2="-4.06" layer="52"/>
<rectangle x1="-11.5728" y1="-6.56" x2="-10.3728" y2="-4.06" layer="51"/>
<rectangle x1="-8.8296" y1="-6.56" x2="-7.6296" y2="-4.06" layer="51"/>
<rectangle x1="-6.0864" y1="-6.56" x2="-4.8864" y2="-4.06" layer="51"/>
<rectangle x1="-4.7148" y1="-6.56" x2="-3.5148" y2="-4.06" layer="52"/>
<rectangle x1="-1.9716" y1="-6.56" x2="-0.7716" y2="-4.06" layer="52"/>
<rectangle x1="0.7716" y1="-6.56" x2="1.9716" y2="-4.06" layer="52"/>
<rectangle x1="-3.3432" y1="-6.56" x2="-2.1432" y2="-4.06" layer="51"/>
<rectangle x1="-0.6" y1="-6.56" x2="0.6" y2="-4.06" layer="51"/>
<rectangle x1="2.1432" y1="-6.56" x2="3.3432" y2="-4.06" layer="51"/>
<rectangle x1="4.8864" y1="-6.56" x2="6.0864" y2="-4.06" layer="51"/>
<rectangle x1="3.5148" y1="-6.56" x2="4.7148" y2="-4.06" layer="52"/>
<rectangle x1="6.258" y1="-6.56" x2="7.458" y2="-4.06" layer="52"/>
<rectangle x1="9.0012" y1="-6.56" x2="10.2012" y2="-4.06" layer="52"/>
<rectangle x1="11.7444" y1="-6.56" x2="12.9444" y2="-4.06" layer="52"/>
<rectangle x1="7.6296" y1="-6.56" x2="8.8296" y2="-4.06" layer="51"/>
<rectangle x1="10.3728" y1="-6.56" x2="11.5728" y2="-4.06" layer="51"/>
<rectangle x1="13.116" y1="-6.56" x2="14.316" y2="-4.06" layer="51"/>
<rectangle x1="14.4876" y1="-6.56" x2="15.6876" y2="-4.06" layer="52"/>
<rectangle x1="17.2308" y1="-6.56" x2="18.4308" y2="-4.06" layer="52"/>
<rectangle x1="19.974" y1="-6.56" x2="21.174" y2="-4.06" layer="52"/>
<rectangle x1="15.8592" y1="-6.56" x2="17.0592" y2="-4.06" layer="51"/>
<rectangle x1="18.6024" y1="-6.56" x2="19.8024" y2="-4.06" layer="51"/>
<rectangle x1="21.3456" y1="-6.56" x2="22.5456" y2="-4.06" layer="51"/>
<rectangle x1="24.0888" y1="-6.56" x2="25.2888" y2="-4.06" layer="51"/>
<rectangle x1="22.7172" y1="-6.56" x2="23.9172" y2="-4.06" layer="52"/>
<rectangle x1="-34.8" y1="0.8" x2="34.6" y2="1.3" layer="21"/>
<rectangle x1="-25.7" y1="-4.1" x2="25.7" y2="-2.5" layer="21"/>
</package>
<package name="F37H">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.924" y1="17.907" x2="-26.67" y2="17.907" width="0.1524" layer="21"/>
<wire x1="-27.432" y1="17.399" x2="-26.924" y2="17.907" width="0.1524" layer="21" curve="-90"/>
<wire x1="26.924" y1="17.907" x2="27.432" y2="17.399" width="0.1524" layer="21" curve="-90"/>
<wire x1="-27.051" y1="11.684" x2="27.051" y2="11.684" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-29.718" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-34.798" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="10.668" x2="-34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.176" x2="-34.798" y2="11.684" width="0.1524" layer="21"/>
<wire x1="34.798" y1="11.684" x2="34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="34.798" y1="11.176" x2="34.798" y2="10.668" width="0.1524" layer="21"/>
<wire x1="34.798" y1="10.668" x2="34.798" y2="7.62" width="0.1524" layer="21"/>
<wire x1="34.798" y1="7.62" x2="34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.176" x2="-32.258" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="11.176" x2="-29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="10.414" x2="-29.718" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="10.668" x2="-29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="10.668" x2="-29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="8.255" x2="-28.956" y2="7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-29.718" y1="7.62" x2="-28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="7.62" x2="-28.575" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="8.255" x2="-29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="7.62" x2="-28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="7.62" x2="28.575" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="6.858" x2="28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="7.62" x2="28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="7.62" x2="28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="7.62" x2="29.718" y2="7.62" width="0.1524" layer="21"/>
<wire x1="32.258" y1="11.176" x2="34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="11.176" x2="29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.718" y1="11.176" x2="32.258" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.718" y1="10.414" x2="29.718" y2="10.668" width="0.1524" layer="21"/>
<wire x1="29.718" y1="10.668" x2="29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.591" y1="8.255" x2="29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="29.591" y1="10.668" x2="29.718" y2="10.668" width="0.1524" layer="21"/>
<wire x1="28.956" y1="7.62" x2="29.591" y2="8.255" width="0.1524" layer="21" curve="90"/>
<wire x1="-34.163" y1="-3.175" x2="-34.798" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-2.54" x2="-34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="-3.175" x2="-34.163" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="-3.175" x2="-28.829" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="-2.667" x2="-28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-2.667" x2="28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-2.667" x2="29.337" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="29.337" y1="-3.175" x2="34.29" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="34.29" y1="-3.175" x2="34.798" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-2.667" x2="34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-2.7686" y1="-1.143" x2="-2.7686" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-16.5608" y1="-1.143" x2="-16.5608" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-19.3294" y1="-1.143" x2="-19.3294" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-17.9324" y1="1.397" x2="-17.9324" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-15.1892" y1="1.397" x2="-15.1892" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-1.3716" y1="1.397" x2="-1.3716" y2="2.413" width="0.8128" layer="51"/>
<wire x1="2.7686" y1="-1.143" x2="2.7686" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="6.9088" y1="1.4224" x2="6.9088" y2="2.4384" width="0.8128" layer="51"/>
<wire x1="16.5608" y1="-1.143" x2="16.5608" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="4.1402" y1="1.4224" x2="4.1402" y2="2.4384" width="0.8128" layer="51"/>
<wire x1="5.5118" y1="-1.143" x2="5.5118" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="1.3716" y1="1.397" x2="1.3716" y2="2.413" width="0.8128" layer="51"/>
<wire x1="0" y1="-1.143" x2="0" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-4.1402" y1="1.397" x2="-4.1402" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-5.5118" y1="-1.143" x2="-5.5118" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="29.718" y1="7.62" x2="34.798" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.684" x2="-27.051" y2="11.684" width="0.1524" layer="21"/>
<wire x1="-27.432" y1="12.319" x2="-27.432" y2="17.399" width="0.1524" layer="21"/>
<wire x1="-28.067" y1="11.684" x2="-27.432" y2="12.319" width="0.1524" layer="21" curve="90"/>
<wire x1="27.051" y1="11.684" x2="34.798" y2="11.684" width="0.1524" layer="21"/>
<wire x1="27.432" y1="12.319" x2="27.432" y2="17.399" width="0.1524" layer="21"/>
<wire x1="27.432" y1="12.319" x2="28.067" y2="11.684" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.701" y1="1.397" x2="-20.701" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-23.4696" y1="1.397" x2="-23.4696" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-22.0726" y1="-1.143" x2="-22.0726" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-24.8412" y1="-1.143" x2="-24.8412" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="17.9578" y1="1.397" x2="17.9578" y2="2.413" width="0.8128" layer="51"/>
<wire x1="19.3294" y1="-1.143" x2="19.3294" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="22.098" y1="-1.143" x2="22.098" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="24.8412" y1="-1.143" x2="24.8412" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="20.701" y1="1.397" x2="20.701" y2="2.413" width="0.8128" layer="51"/>
<wire x1="23.4442" y1="1.397" x2="23.4442" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-13.7922" y1="-1.143" x2="-13.7922" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-11.049" y1="-1.143" x2="-11.049" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-8.2804" y1="-1.143" x2="-8.2804" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-12.4206" y1="1.397" x2="-12.4206" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-9.652" y1="1.397" x2="-9.652" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-6.9088" y1="1.397" x2="-6.9088" y2="2.413" width="0.8128" layer="51"/>
<wire x1="8.2804" y1="-1.143" x2="8.2804" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="11.049" y1="-1.143" x2="11.049" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="9.6774" y1="1.397" x2="9.6774" y2="2.413" width="0.8128" layer="51"/>
<wire x1="13.8176" y1="-1.143" x2="13.8176" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="12.4206" y1="1.397" x2="12.4206" y2="2.413" width="0.8128" layer="51"/>
<wire x1="15.1892" y1="1.397" x2="15.1892" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-26.67" y1="17.907" x2="26.67" y2="17.907" width="0.1524" layer="21"/>
<wire x1="26.67" y1="17.907" x2="26.924" y2="17.907" width="0.1524" layer="21"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<pad name="1" x="-24.8412" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.0726" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.7922" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="1.27" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="1.27" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9324" y="1.27" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="1.27" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="1.27" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="1.27" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="1.27" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="1.27" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="1.27" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="1.27" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="1.27" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="13.8176" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="32" x="9.6774" y="1.27" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="1.27" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="1.27" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9578" y="1.27" drill="1.016" shape="octagon"/>
<pad name="18" x="22.098" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="19" x="24.8412" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="1.27" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="1.27" drill="1.016" shape="octagon"/>
<text x="-34.544" y="-6.35" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-17.78" y="13.97" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-26.924" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="26.035" y="-1.905" size="1.27" layer="21" ratio="10">19</text>
<text x="-28.067" y="0.635" size="1.27" layer="21" ratio="10">20</text>
<text x="26.035" y="0.635" size="1.27" layer="21" ratio="10">37</text>
<text x="34.29" y="2.54" size="1.27" layer="21" ratio="10" rot="R90">2,54</text>
<text x="-26.924" y="8.509" size="1.27" layer="21" ratio="10">F37</text>
<rectangle x1="-28.575" y1="6.858" x2="28.575" y2="7.62" layer="21"/>
<rectangle x1="-34.798" y1="11.176" x2="34.798" y2="11.684" layer="21"/>
<rectangle x1="-25.2476" y1="-0.381" x2="-24.4348" y2="6.858" layer="21"/>
<rectangle x1="-23.876" y1="2.159" x2="-23.0632" y2="6.858" layer="21"/>
<rectangle x1="-22.479" y1="-0.381" x2="-21.6662" y2="6.858" layer="21"/>
<rectangle x1="-21.1074" y1="2.159" x2="-20.2946" y2="6.858" layer="21"/>
<rectangle x1="-19.7358" y1="-0.381" x2="-18.923" y2="6.858" layer="21"/>
<rectangle x1="-18.3388" y1="2.159" x2="-17.526" y2="6.858" layer="21"/>
<rectangle x1="-16.9672" y1="-0.381" x2="-16.1544" y2="6.858" layer="21"/>
<rectangle x1="-15.5956" y1="2.159" x2="-14.7828" y2="6.858" layer="21"/>
<rectangle x1="-14.1986" y1="-0.381" x2="-13.3858" y2="6.858" layer="21"/>
<rectangle x1="-12.827" y1="2.159" x2="-12.0142" y2="6.858" layer="21"/>
<rectangle x1="-11.4554" y1="-0.381" x2="-10.6426" y2="6.858" layer="21"/>
<rectangle x1="-10.0584" y1="2.159" x2="-9.2456" y2="6.858" layer="21"/>
<rectangle x1="-8.6868" y1="-0.381" x2="-7.874" y2="6.858" layer="21"/>
<rectangle x1="-7.3152" y1="2.159" x2="-6.5024" y2="6.858" layer="21"/>
<rectangle x1="-5.9182" y1="-0.381" x2="-5.1054" y2="6.858" layer="21"/>
<rectangle x1="-4.5466" y1="2.159" x2="-3.7338" y2="6.858" layer="21"/>
<rectangle x1="-3.175" y1="-0.381" x2="-2.3622" y2="6.858" layer="21"/>
<rectangle x1="-1.778" y1="2.159" x2="-0.9652" y2="6.858" layer="21"/>
<rectangle x1="-0.4064" y1="-0.381" x2="0.4064" y2="6.858" layer="21"/>
<rectangle x1="0.9652" y1="2.159" x2="1.778" y2="6.858" layer="21"/>
<rectangle x1="2.3622" y1="-0.381" x2="3.175" y2="6.858" layer="21"/>
<rectangle x1="3.7338" y1="2.159" x2="4.5466" y2="6.858" layer="21"/>
<rectangle x1="5.1054" y1="-0.381" x2="5.9182" y2="6.858" layer="21"/>
<rectangle x1="6.5024" y1="2.159" x2="7.3152" y2="6.858" layer="21"/>
<rectangle x1="7.874" y1="-0.381" x2="8.6868" y2="6.858" layer="21"/>
<rectangle x1="9.271" y1="2.159" x2="10.0838" y2="6.858" layer="21"/>
<rectangle x1="10.6426" y1="-0.381" x2="11.4554" y2="6.858" layer="21"/>
<rectangle x1="12.0142" y1="2.159" x2="12.827" y2="6.858" layer="21"/>
<rectangle x1="13.4112" y1="-0.381" x2="14.224" y2="6.858" layer="21"/>
<rectangle x1="14.7828" y1="2.159" x2="15.5956" y2="6.858" layer="21"/>
<rectangle x1="16.1544" y1="-0.381" x2="16.9672" y2="6.858" layer="21"/>
<rectangle x1="17.5514" y1="2.159" x2="18.3642" y2="6.858" layer="21"/>
<rectangle x1="18.923" y1="-0.381" x2="19.7358" y2="6.858" layer="21"/>
<rectangle x1="20.2946" y1="2.159" x2="21.1074" y2="6.858" layer="21"/>
<rectangle x1="21.6916" y1="-0.381" x2="22.5044" y2="6.858" layer="21"/>
<rectangle x1="23.0378" y1="2.159" x2="23.8506" y2="6.858" layer="21"/>
<rectangle x1="24.4348" y1="-0.381" x2="25.2476" y2="6.858" layer="21"/>
<hole x="-31.75" y="0" drill="3.302"/>
<hole x="31.75" y="0" drill="3.302"/>
</package>
<package name="F37HP">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.924" y1="17.907" x2="-26.67" y2="17.907" width="0.1524" layer="21"/>
<wire x1="-27.432" y1="17.399" x2="-26.924" y2="17.907" width="0.1524" layer="21" curve="-90"/>
<wire x1="26.924" y1="17.907" x2="27.432" y2="17.399" width="0.1524" layer="21" curve="-90"/>
<wire x1="-27.051" y1="11.684" x2="27.051" y2="11.684" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-29.718" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-34.798" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="7.62" x2="-34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="10.668" x2="-34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.176" x2="-34.798" y2="11.684" width="0.1524" layer="21"/>
<wire x1="34.798" y1="11.684" x2="34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="34.798" y1="11.176" x2="34.798" y2="10.668" width="0.1524" layer="21"/>
<wire x1="34.798" y1="10.668" x2="34.798" y2="7.62" width="0.1524" layer="21"/>
<wire x1="34.798" y1="7.62" x2="34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.176" x2="-32.258" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-32.258" y1="11.176" x2="-29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="10.668" x2="-29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="10.668" x2="-29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="8.255" x2="-28.956" y2="7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-29.718" y1="7.62" x2="-28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="7.62" x2="-28.575" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-29.591" y1="8.255" x2="-29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="7.62" x2="-28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="7.62" x2="28.575" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-28.575" y1="6.858" x2="28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="7.62" x2="28.575" y2="6.858" width="0.1524" layer="21"/>
<wire x1="28.575" y1="7.62" x2="28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="7.62" x2="29.718" y2="7.62" width="0.1524" layer="21"/>
<wire x1="32.258" y1="11.176" x2="34.798" y2="11.176" width="0.1524" layer="21"/>
<wire x1="-29.718" y1="11.176" x2="29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.718" y1="11.176" x2="32.258" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.718" y1="10.668" x2="29.718" y2="11.176" width="0.1524" layer="21"/>
<wire x1="29.591" y1="8.255" x2="29.591" y2="10.668" width="0.1524" layer="21"/>
<wire x1="29.591" y1="10.668" x2="29.718" y2="10.668" width="0.1524" layer="21"/>
<wire x1="28.956" y1="7.62" x2="29.591" y2="8.255" width="0.1524" layer="21" curve="90"/>
<wire x1="-34.163" y1="-3.175" x2="-34.798" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-2.54" x2="-34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="-3.175" x2="-34.163" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-29.337" y1="-3.175" x2="-28.829" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-28.829" y1="-2.667" x2="-28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-2.667" x2="28.829" y2="7.62" width="0.1524" layer="21"/>
<wire x1="28.829" y1="-2.667" x2="29.337" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="29.337" y1="-3.175" x2="34.29" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="34.29" y1="-3.175" x2="34.798" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="34.798" y1="-2.667" x2="34.798" y2="7.493" width="0.1524" layer="21"/>
<wire x1="-2.7686" y1="-1.143" x2="-2.7686" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-16.5608" y1="-1.143" x2="-16.5608" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-19.3294" y1="-1.143" x2="-19.3294" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-17.9324" y1="1.397" x2="-17.9324" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-15.1892" y1="1.397" x2="-15.1892" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-1.3716" y1="1.397" x2="-1.3716" y2="2.413" width="0.8128" layer="51"/>
<wire x1="2.7686" y1="-1.143" x2="2.7686" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="6.9088" y1="1.397" x2="6.9088" y2="2.413" width="0.8128" layer="51"/>
<wire x1="16.5608" y1="-1.143" x2="16.5608" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="4.1402" y1="1.397" x2="4.1402" y2="2.413" width="0.8128" layer="51"/>
<wire x1="5.5118" y1="-1.143" x2="5.5118" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="1.3716" y1="1.397" x2="1.3716" y2="2.413" width="0.8128" layer="51"/>
<wire x1="0" y1="-1.143" x2="0" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-4.1402" y1="1.397" x2="-4.1402" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-5.5118" y1="-1.143" x2="-5.5118" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="29.718" y1="7.62" x2="34.798" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="11.684" x2="-27.051" y2="11.684" width="0.1524" layer="21"/>
<wire x1="-27.432" y1="12.319" x2="-27.432" y2="17.399" width="0.1524" layer="21"/>
<wire x1="-28.067" y1="11.684" x2="-27.432" y2="12.319" width="0.1524" layer="21" curve="90"/>
<wire x1="27.051" y1="11.684" x2="34.798" y2="11.684" width="0.1524" layer="21"/>
<wire x1="27.432" y1="12.319" x2="27.432" y2="17.399" width="0.1524" layer="21"/>
<wire x1="27.432" y1="12.319" x2="28.067" y2="11.684" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.701" y1="1.397" x2="-20.701" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-23.4696" y1="1.397" x2="-23.4696" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-22.0726" y1="-1.143" x2="-22.0726" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-24.8412" y1="-1.143" x2="-24.8412" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="17.9578" y1="1.397" x2="17.9578" y2="2.413" width="0.8128" layer="51"/>
<wire x1="19.3294" y1="-1.143" x2="19.3294" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="22.098" y1="-1.143" x2="22.098" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="24.8412" y1="-1.143" x2="24.8412" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="20.701" y1="1.397" x2="20.701" y2="2.413" width="0.8128" layer="51"/>
<wire x1="23.4696" y1="1.397" x2="23.4696" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-13.7922" y1="-1.143" x2="-13.7922" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-11.049" y1="-1.143" x2="-11.049" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-8.2804" y1="-1.143" x2="-8.2804" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="-12.4206" y1="1.397" x2="-12.4206" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-9.652" y1="1.397" x2="-9.652" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-6.9088" y1="1.397" x2="-6.9088" y2="2.413" width="0.8128" layer="51"/>
<wire x1="8.2804" y1="-1.143" x2="8.2804" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="11.049" y1="-1.143" x2="11.049" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="9.652" y1="1.397" x2="9.652" y2="2.413" width="0.8128" layer="51"/>
<wire x1="13.8176" y1="-1.143" x2="13.8176" y2="-0.127" width="0.8128" layer="51"/>
<wire x1="12.4206" y1="1.397" x2="12.4206" y2="2.413" width="0.8128" layer="51"/>
<wire x1="15.1892" y1="1.397" x2="15.1892" y2="2.413" width="0.8128" layer="51"/>
<wire x1="-26.67" y1="17.907" x2="26.67" y2="17.907" width="0.1524" layer="21"/>
<wire x1="26.67" y1="17.907" x2="26.924" y2="17.907" width="0.1524" layer="21"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<pad name="1" x="-24.8412" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.0726" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.7922" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="1.27" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="1.27" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9324" y="1.27" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="1.27" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="1.27" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="1.27" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="1.27" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="1.27" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="1.27" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="1.27" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="1.27" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="13.8176" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="32" x="9.6774" y="1.27" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="1.27" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="1.27" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9578" y="1.27" drill="1.016" shape="octagon"/>
<pad name="18" x="22.098" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="19" x="24.8412" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="1.27" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="1.27" drill="1.016" shape="octagon"/>
<pad name="G1" x="-31.75" y="0" drill="3.302" diameter="5.08"/>
<pad name="G2" x="31.75" y="0" drill="3.302" diameter="5.08"/>
<text x="-34.544" y="-6.35" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-17.78" y="13.97" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-26.924" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="26.035" y="-1.905" size="1.27" layer="21" ratio="10">19</text>
<text x="-28.067" y="0.635" size="1.27" layer="21" ratio="10">20</text>
<text x="26.035" y="0.635" size="1.27" layer="21" ratio="10">37</text>
<text x="34.29" y="2.54" size="1.27" layer="21" ratio="10" rot="R90">2,54</text>
<text x="-26.924" y="8.509" size="1.27" layer="21" ratio="10">F37</text>
<rectangle x1="-28.575" y1="6.858" x2="28.575" y2="7.62" layer="21"/>
<rectangle x1="-34.798" y1="11.176" x2="34.798" y2="11.684" layer="21"/>
<rectangle x1="-25.2476" y1="-0.381" x2="-24.4348" y2="6.858" layer="21"/>
<rectangle x1="-23.876" y1="2.159" x2="-23.0632" y2="6.858" layer="21"/>
<rectangle x1="-22.479" y1="-0.381" x2="-21.6662" y2="6.858" layer="21"/>
<rectangle x1="-21.1074" y1="2.159" x2="-20.2946" y2="6.858" layer="21"/>
<rectangle x1="-19.7358" y1="-0.381" x2="-18.923" y2="6.858" layer="21"/>
<rectangle x1="-18.3388" y1="2.159" x2="-17.526" y2="6.858" layer="21"/>
<rectangle x1="-16.9672" y1="-0.381" x2="-16.1544" y2="6.858" layer="21"/>
<rectangle x1="-15.5956" y1="2.159" x2="-14.7828" y2="6.858" layer="21"/>
<rectangle x1="-14.1986" y1="-0.381" x2="-13.3858" y2="6.858" layer="21"/>
<rectangle x1="-12.827" y1="2.159" x2="-12.0142" y2="6.858" layer="21"/>
<rectangle x1="-11.4554" y1="-0.381" x2="-10.6426" y2="6.858" layer="21"/>
<rectangle x1="-10.0584" y1="2.159" x2="-9.2456" y2="6.858" layer="21"/>
<rectangle x1="-8.6868" y1="-0.381" x2="-7.874" y2="6.858" layer="21"/>
<rectangle x1="-7.3152" y1="2.159" x2="-6.5024" y2="6.858" layer="21"/>
<rectangle x1="-5.9182" y1="-0.381" x2="-5.1054" y2="6.858" layer="21"/>
<rectangle x1="-4.5466" y1="2.159" x2="-3.7338" y2="6.858" layer="21"/>
<rectangle x1="-3.1496" y1="-0.381" x2="-2.3368" y2="6.858" layer="21"/>
<rectangle x1="-1.778" y1="2.159" x2="-0.9652" y2="6.858" layer="21"/>
<rectangle x1="-0.4064" y1="-0.381" x2="0.4064" y2="6.858" layer="21"/>
<rectangle x1="0.9652" y1="2.159" x2="1.778" y2="6.858" layer="21"/>
<rectangle x1="2.3622" y1="-0.381" x2="3.175" y2="6.858" layer="21"/>
<rectangle x1="3.7338" y1="2.159" x2="4.5466" y2="6.858" layer="21"/>
<rectangle x1="5.1054" y1="-0.381" x2="5.9182" y2="6.858" layer="21"/>
<rectangle x1="6.5024" y1="2.159" x2="7.3152" y2="6.858" layer="21"/>
<rectangle x1="7.874" y1="-0.381" x2="8.6868" y2="6.858" layer="21"/>
<rectangle x1="9.2456" y1="2.159" x2="10.0584" y2="6.858" layer="21"/>
<rectangle x1="10.6426" y1="-0.381" x2="11.4554" y2="6.858" layer="21"/>
<rectangle x1="12.0142" y1="2.159" x2="12.827" y2="6.858" layer="21"/>
<rectangle x1="13.4112" y1="-0.381" x2="14.224" y2="6.858" layer="21"/>
<rectangle x1="14.7828" y1="2.159" x2="15.5956" y2="6.858" layer="21"/>
<rectangle x1="16.1544" y1="-0.381" x2="16.9672" y2="6.858" layer="21"/>
<rectangle x1="17.5514" y1="2.159" x2="18.3642" y2="6.858" layer="21"/>
<rectangle x1="18.9484" y1="-0.381" x2="19.7612" y2="6.858" layer="21"/>
<rectangle x1="20.2946" y1="2.159" x2="21.1074" y2="6.858" layer="21"/>
<rectangle x1="21.6662" y1="-0.381" x2="22.479" y2="6.858" layer="21"/>
<rectangle x1="23.0632" y1="2.159" x2="23.876" y2="6.858" layer="21"/>
<rectangle x1="24.4348" y1="-0.381" x2="25.2476" y2="6.858" layer="21"/>
</package>
<package name="F37V">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.8224" y1="-2.9464" x2="-27.6098" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="25.527" y1="-3.937" x2="26.8357" y2="-2.905" width="0.1524" layer="21" curve="76.489196"/>
<wire x1="26.289" y1="3.937" x2="27.6045" y2="2.3038" width="0.1524" layer="21" curve="-102.298925"/>
<wire x1="27.6098" y1="2.3114" x2="26.8224" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="3.937" x2="26.289" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-27.6091" y1="2.3268" x2="-26.289" y2="3.937" width="0.1524" layer="21" curve="-101.30773"/>
<wire x1="-26.8299" y1="-2.9295" x2="-25.527" y2="-3.937" width="0.1524" layer="21" curve="75.428151"/>
<wire x1="-25.527" y1="-3.937" x2="25.527" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.798" y1="5.588" x2="34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.464" y1="-6.223" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="42"/>
<circle x="-31.75" y="0" radius="2.667" width="0" layer="43"/>
<circle x="1.3716" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="0" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-1.3716" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="2.7686" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-2.7686" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="4.1402" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-4.1402" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="5.5118" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="8.2804" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="6.9088" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="9.652" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="11.049" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="12.4206" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="13.7922" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="15.1892" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="16.5608" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-5.5118" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-8.2804" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-11.049" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-6.9088" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-9.652" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-12.4206" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-13.7922" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-16.5608" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-15.1892" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="19.3294" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="22.0726" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="24.8412" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="17.9324" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="20.701" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="23.4696" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-19.3294" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-22.0726" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-24.8412" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-17.9324" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-20.701" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-23.4696" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<pad name="1" x="24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="22.0726" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="13.7922" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="-2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="-5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="-8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="17.9324" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="-1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="-4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="-6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="-11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="-13.8176" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="-16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="-19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="-9.6774" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="-12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="-15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="-17.9578" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="-22.098" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="19" x="-24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="-20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="-23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<text x="24.5364" y="2.54" size="0.9906" layer="21" ratio="12">1</text>
<text x="21.6154" y="2.54" size="0.9906" layer="21" ratio="12">2</text>
<text x="18.9484" y="2.54" size="0.9906" layer="21" ratio="12">3</text>
<text x="16.1544" y="2.54" size="0.9906" layer="21" ratio="12">4</text>
<text x="13.3604" y="2.54" size="0.9906" layer="21" ratio="12">5</text>
<text x="10.5664" y="2.54" size="0.9906" layer="21" ratio="12">6</text>
<text x="7.8994" y="2.54" size="0.9906" layer="21" ratio="12">7</text>
<text x="5.1054" y="2.54" size="0.9906" layer="21" ratio="12">8</text>
<text x="2.3114" y="2.54" size="0.9906" layer="21" ratio="12">9</text>
<text x="-34.671" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-0.7366" y="2.54" size="0.9906" layer="21" ratio="12">10</text>
<text x="-3.4036" y="2.54" size="0.9906" layer="21" ratio="12">11</text>
<text x="-6.1976" y="2.54" size="0.9906" layer="21" ratio="12">12</text>
<text x="-8.9916" y="2.54" size="0.9906" layer="21" ratio="12">13</text>
<text x="8.7122" y="-3.556" size="0.9906" layer="21" ratio="12">25</text>
<text x="11.5062" y="-3.556" size="0.9906" layer="21" ratio="12">24</text>
<text x="14.4272" y="-3.556" size="0.9906" layer="21" ratio="12">23</text>
<text x="17.2212" y="-3.556" size="0.9906" layer="21" ratio="12">22</text>
<text x="19.8882" y="-3.556" size="0.9906" layer="21" ratio="12">21</text>
<text x="22.5552" y="-3.556" size="0.9906" layer="21" ratio="12">20</text>
<text x="-25.5778" y="2.5654" size="0.9906" layer="21" ratio="12">19</text>
<text x="-22.9108" y="2.5654" size="0.9906" layer="21" ratio="12">18</text>
<text x="-20.2438" y="2.5654" size="0.9906" layer="21" ratio="12">17</text>
<text x="-17.4498" y="2.5654" size="0.9906" layer="21" ratio="12">16</text>
<text x="-14.6558" y="2.5654" size="0.9906" layer="21" ratio="12">15</text>
<text x="-11.8618" y="2.5654" size="0.9906" layer="21" ratio="12">14</text>
<text x="6.096" y="-3.556" size="0.9906" layer="21" ratio="12">26</text>
<text x="3.302" y="-3.556" size="0.9906" layer="21" ratio="12">27</text>
<text x="0.508" y="-3.556" size="0.9906" layer="21" ratio="12">28</text>
<text x="-2.159" y="-3.556" size="0.9906" layer="21" ratio="12">29</text>
<text x="-4.953" y="-3.556" size="0.9906" layer="21" ratio="12">30</text>
<text x="-7.747" y="-3.556" size="0.9906" layer="21" ratio="12">31</text>
<text x="-10.414" y="-3.556" size="0.9906" layer="21" ratio="12">32</text>
<text x="-13.208" y="-3.556" size="0.9906" layer="21" ratio="12">33</text>
<text x="-16.002" y="-3.556" size="0.9906" layer="21" ratio="12">34</text>
<text x="-18.669" y="-3.556" size="0.9906" layer="21" ratio="12">35</text>
<text x="-21.463" y="-3.556" size="0.9906" layer="21" ratio="12">36</text>
<text x="-24.257" y="-3.556" size="0.9906" layer="21" ratio="12">37</text>
<hole x="31.75" y="0" drill="3.302"/>
<hole x="-31.75" y="0" drill="3.302"/>
</package>
<package name="F37VP">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="-26.8224" y1="-2.9464" x2="-27.6098" y2="2.3368" width="0.1524" layer="21"/>
<wire x1="25.527" y1="-3.937" x2="26.8357" y2="-2.905" width="0.1524" layer="21" curve="76.489196"/>
<wire x1="26.289" y1="3.937" x2="27.6045" y2="2.3038" width="0.1524" layer="21" curve="-102.298925"/>
<wire x1="27.6098" y1="2.3114" x2="26.8224" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-26.289" y1="3.937" x2="26.289" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-27.6091" y1="2.3268" x2="-26.289" y2="3.937" width="0.1524" layer="21" curve="-101.30773"/>
<wire x1="-26.8299" y1="-2.9295" x2="-25.527" y2="-3.937" width="0.1524" layer="21" curve="75.428151"/>
<wire x1="-25.527" y1="-3.937" x2="25.527" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.798" y1="5.588" x2="34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.798" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="29.464" y1="-6.223" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<circle x="1.3716" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="0" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-1.3716" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="31.75" y="0" radius="1.651" width="0.1524" layer="21"/>
<circle x="2.7686" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-2.7686" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="4.1402" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-4.1402" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="5.5118" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="8.2804" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="6.9088" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="9.652" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="11.049" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="12.4206" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="13.7922" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="15.1892" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="16.5608" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-5.5118" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-8.2804" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-11.049" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-6.9088" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-9.652" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-12.4206" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-13.7922" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-16.5608" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-15.1892" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="19.3294" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="22.0726" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="24.8412" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="17.9324" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="20.701" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="23.4696" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-19.3294" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-22.0726" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-24.8412" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-17.9324" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-20.701" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-23.4696" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<pad name="1" x="24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="22.0726" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="13.7922" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="-2.7686" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="-5.5118" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="-8.2804" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="17.9324" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="9.652" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="-1.3716" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="-4.1402" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="-6.9088" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="-11.049" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="-13.8176" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="-16.5608" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="-19.3294" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="-9.6774" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="-12.4206" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="-15.1892" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="-17.9578" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="-22.098" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="19" x="-24.8412" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="-20.701" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="-23.4696" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="G1" x="-31.75" y="0" drill="3.302" diameter="5.08"/>
<pad name="G2" x="31.75" y="0" drill="3.302" diameter="5.08"/>
<text x="24.5364" y="2.54" size="0.9906" layer="21" ratio="12">1</text>
<text x="21.6154" y="2.54" size="0.9906" layer="21" ratio="12">2</text>
<text x="18.9484" y="2.54" size="0.9906" layer="21" ratio="12">3</text>
<text x="16.1544" y="2.54" size="0.9906" layer="21" ratio="12">4</text>
<text x="13.3604" y="2.54" size="0.9906" layer="21" ratio="12">5</text>
<text x="10.5664" y="2.54" size="0.9906" layer="21" ratio="12">6</text>
<text x="7.8994" y="2.54" size="0.9906" layer="21" ratio="12">7</text>
<text x="5.1054" y="2.54" size="0.9906" layer="21" ratio="12">8</text>
<text x="2.3114" y="2.54" size="0.9906" layer="21" ratio="12">9</text>
<text x="-34.671" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-0.7366" y="2.54" size="0.9906" layer="21" ratio="12">10</text>
<text x="-3.4036" y="2.54" size="0.9906" layer="21" ratio="12">11</text>
<text x="-6.1976" y="2.54" size="0.9906" layer="21" ratio="12">12</text>
<text x="-8.9916" y="2.54" size="0.9906" layer="21" ratio="12">13</text>
<text x="8.7122" y="-3.556" size="0.9906" layer="21" ratio="12">25</text>
<text x="11.5062" y="-3.556" size="0.9906" layer="21" ratio="12">24</text>
<text x="14.4272" y="-3.556" size="0.9906" layer="21" ratio="12">23</text>
<text x="17.2212" y="-3.556" size="0.9906" layer="21" ratio="12">22</text>
<text x="19.8882" y="-3.556" size="0.9906" layer="21" ratio="12">21</text>
<text x="22.5552" y="-3.556" size="0.9906" layer="21" ratio="12">20</text>
<text x="-25.5778" y="2.5654" size="0.9906" layer="21" ratio="12">19</text>
<text x="-22.9108" y="2.5654" size="0.9906" layer="21" ratio="12">18</text>
<text x="-20.2438" y="2.5654" size="0.9906" layer="21" ratio="12">17</text>
<text x="-17.4498" y="2.5654" size="0.9906" layer="21" ratio="12">16</text>
<text x="-14.6558" y="2.5654" size="0.9906" layer="21" ratio="12">15</text>
<text x="-11.8618" y="2.5654" size="0.9906" layer="21" ratio="12">14</text>
<text x="6.096" y="-3.556" size="0.9906" layer="21" ratio="12">26</text>
<text x="3.302" y="-3.556" size="0.9906" layer="21" ratio="12">27</text>
<text x="0.508" y="-3.556" size="0.9906" layer="21" ratio="12">28</text>
<text x="-2.159" y="-3.556" size="0.9906" layer="21" ratio="12">29</text>
<text x="-4.953" y="-3.556" size="0.9906" layer="21" ratio="12">30</text>
<text x="-7.747" y="-3.556" size="0.9906" layer="21" ratio="12">31</text>
<text x="-10.414" y="-3.556" size="0.9906" layer="21" ratio="12">32</text>
<text x="-13.208" y="-3.556" size="0.9906" layer="21" ratio="12">33</text>
<text x="-16.002" y="-3.556" size="0.9906" layer="21" ratio="12">34</text>
<text x="-18.669" y="-3.556" size="0.9906" layer="21" ratio="12">35</text>
<text x="-21.463" y="-3.556" size="0.9906" layer="21" ratio="12">36</text>
<text x="-24.257" y="-3.556" size="0.9906" layer="21" ratio="12">37</text>
</package>
<package name="F37VB">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<wire x1="26.8224" y1="2.9464" x2="27.6098" y2="-2.3368" width="0.1524" layer="21"/>
<wire x1="-26.8357" y1="2.905" x2="-25.527" y2="3.937" width="0.1524" layer="21" curve="-76.489196"/>
<wire x1="-27.6045" y1="-2.3038" x2="-26.289" y2="-3.937" width="0.1524" layer="21" curve="102.298925"/>
<wire x1="-27.6098" y1="-2.3114" x2="-26.8224" y2="2.921" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-3.937" x2="-26.289" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="26.289" y1="-3.937" x2="27.6091" y2="-2.3268" width="0.1524" layer="21" curve="101.30773"/>
<wire x1="25.527" y1="3.937" x2="26.8299" y2="2.9295" width="0.1524" layer="21" curve="-75.428151"/>
<wire x1="25.527" y1="3.937" x2="-25.527" y2="3.937" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.223" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="6.096" x2="29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.096" x2="29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="6.223" x2="-29.464" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="34.163" y1="6.223" x2="34.798" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.798" y1="5.588" x2="-34.163" y2="6.223" width="0.1524" layer="21" curve="-90"/>
<wire x1="-34.163" y1="-6.223" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.798" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-34.798" y1="-5.588" x2="-34.163" y2="-6.223" width="0.1524" layer="21" curve="90"/>
<wire x1="34.798" y1="-5.588" x2="34.798" y2="5.588" width="0.1524" layer="21"/>
<wire x1="34.163" y1="-6.223" x2="34.798" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-29.464" y1="6.223" x2="-29.464" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.223" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="6.096" x2="-32.004" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.096" x2="-32.004" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="6.223" x2="-34.163" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="-29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.223" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-29.464" y1="-6.096" x2="-32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.096" x2="-32.004" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-32.004" y1="-6.223" x2="-29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="32.004" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.223" x2="34.163" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="32.004" y1="-6.096" x2="29.464" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.096" x2="29.464" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="29.464" y1="-6.223" x2="32.004" y2="-6.223" width="0.1524" layer="21"/>
<circle x="-1.3716" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="0" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="1.3716" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-2.7686" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="2.7686" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-4.1402" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="4.1402" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-5.5118" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-8.2804" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-6.9088" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-9.652" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-11.049" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-12.4206" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-13.7922" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-15.1892" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-16.5608" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="5.5118" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="8.2804" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="11.049" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="6.9088" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="9.652" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="12.4206" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="13.7922" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="16.5608" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="15.1892" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-19.3294" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-22.0726" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-24.8412" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-17.9324" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-20.701" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="-23.4696" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="19.3294" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="22.0726" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="24.8412" y="-1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="17.9324" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="20.701" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<circle x="23.4696" y="1.4224" radius="0.762" width="0.254" layer="51"/>
<pad name="1" x="-24.8412" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="2" x="-22.0726" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="3" x="-19.3294" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="4" x="-16.5608" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="5" x="-13.7922" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.049" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.2804" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="8" x="-5.5118" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="9" x="-2.7686" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="10" x="0" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="11" x="2.7686" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="12" x="5.5118" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="13" x="8.2804" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="20" x="-23.4696" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="21" x="-20.701" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="22" x="-17.9324" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="23" x="-15.1892" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="24" x="-12.4206" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="25" x="-9.652" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="26" x="-6.9088" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="27" x="-4.1402" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="28" x="-1.3716" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="29" x="1.3716" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="30" x="4.1402" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="31" x="6.9088" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="14" x="11.049" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="15" x="13.8176" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="16" x="16.5608" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="17" x="19.3294" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="32" x="9.6774" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="33" x="12.4206" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="34" x="15.1892" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="35" x="17.9578" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="18" x="22.098" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="19" x="24.8412" y="-1.4224" drill="1.016" shape="octagon"/>
<pad name="36" x="20.701" y="1.4224" drill="1.016" shape="octagon"/>
<pad name="37" x="23.4696" y="1.4224" drill="1.016" shape="octagon"/>
<text x="-24.5364" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">1</text>
<text x="-21.6154" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">2</text>
<text x="-18.9484" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">3</text>
<text x="-16.1544" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">4</text>
<text x="-13.3604" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">5</text>
<text x="-10.5664" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">6</text>
<text x="-7.8994" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">7</text>
<text x="-5.1054" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">8</text>
<text x="-2.3114" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">9</text>
<text x="-34.671" y="8.255" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-17.78" y="8.255" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="0.7366" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">10</text>
<text x="3.4036" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">11</text>
<text x="6.1976" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">12</text>
<text x="8.9916" y="-2.54" size="0.9906" layer="21" ratio="12" rot="R180">13</text>
<text x="-8.7122" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">25</text>
<text x="-11.5062" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">24</text>
<text x="-14.4272" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">23</text>
<text x="-17.2212" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">22</text>
<text x="-19.8882" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">21</text>
<text x="-22.5552" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">20</text>
<text x="25.5778" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">19</text>
<text x="22.9108" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">18</text>
<text x="20.2438" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">17</text>
<text x="17.4498" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">16</text>
<text x="14.6558" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">15</text>
<text x="11.8618" y="-2.5654" size="0.9906" layer="21" ratio="12" rot="R180">14</text>
<text x="-6.096" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">26</text>
<text x="-3.302" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">27</text>
<text x="-0.508" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">28</text>
<text x="2.159" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">29</text>
<text x="4.953" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">30</text>
<text x="7.747" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">31</text>
<text x="10.414" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">32</text>
<text x="13.208" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">33</text>
<text x="16.002" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">34</text>
<text x="18.669" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">35</text>
<text x="21.463" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">36</text>
<text x="24.257" y="3.556" size="0.9906" layer="21" ratio="12" rot="R180">37</text>
</package>
</packages>
<symbols>
<symbol name="M37">
<wire x1="1.27" y1="20.32" x2="2.54" y2="20.32" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="20.32" x2="-1.27" y2="20.32" width="0.6096" layer="94"/>
<wire x1="1.27" y1="15.24" x2="2.54" y2="15.24" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="17.78" x2="-1.27" y2="17.78" width="0.6096" layer="94"/>
<wire x1="1.27" y1="10.16" x2="2.54" y2="10.16" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="15.24" x2="-1.27" y2="15.24" width="0.6096" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="12.7" x2="-1.27" y2="12.7" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="10.16" x2="-1.27" y2="10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="2.54" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="7.62" x2="-1.27" y2="7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-10.16" x2="2.54" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-1.27" y2="5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-15.24" x2="2.54" y2="-15.24" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-20.32" x2="2.54" y2="-20.32" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-25.4" x2="2.54" y2="-25.4" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-1.27" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="17.78" x2="2.54" y2="17.78" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-1.27" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="1.27" y1="12.7" x2="2.54" y2="12.7" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-1.27" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="1.27" y1="7.62" x2="2.54" y2="7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-10.16" x2="-1.27" y2="-10.16" width="0.6096" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-12.7" x2="-1.27" y2="-12.7" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-15.24" x2="-1.27" y2="-15.24" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="2.54" y2="-7.62" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-17.78" x2="-1.27" y2="-17.78" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-12.7" x2="2.54" y2="-12.7" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-20.32" x2="-1.27" y2="-20.32" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-17.78" x2="2.54" y2="-17.78" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-22.86" x2="-1.27" y2="-22.86" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-22.86" x2="2.54" y2="-22.86" width="0.6096" layer="94"/>
<wire x1="2.5226" y1="-28.4918" x2="4.0637" y2="-27.2512" width="0.4064" layer="94" curve="102.322193" cap="flat"/>
<wire x1="2.5226" y1="-28.4918" x2="-3.0654" y2="-27.2694" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="-26.0288" x2="-3.0654" y2="-27.2694" width="0.4064" layer="94" curve="77.657889"/>
<wire x1="-4.064" y1="20.9488" x2="-4.064" y2="-26.0288" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="20.9488" x2="-3.0654" y2="22.1894" width="0.4064" layer="94" curve="-77.657889"/>
<wire x1="4.064" y1="22.1712" x2="4.064" y2="-27.2512" width="0.4064" layer="94"/>
<wire x1="2.5226" y1="23.4118" x2="-3.0654" y2="22.1894" width="0.4064" layer="94"/>
<wire x1="2.5226" y1="23.4119" x2="4.064" y2="22.1712" width="0.4064" layer="94" curve="-102.337599" cap="flat"/>
<text x="-3.81" y="-31.115" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="24.13" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="7.62" y="20.32" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="20" x="-7.62" y="20.32" visible="pad" length="middle" direction="pas"/>
<pin name="2" x="7.62" y="17.78" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="21" x="-7.62" y="17.78" visible="pad" length="middle" direction="pas"/>
<pin name="3" x="7.62" y="15.24" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="22" x="-7.62" y="15.24" visible="pad" length="middle" direction="pas"/>
<pin name="4" x="7.62" y="12.7" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="23" x="-7.62" y="12.7" visible="pad" length="middle" direction="pas"/>
<pin name="5" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="24" x="-7.62" y="10.16" visible="pad" length="middle" direction="pas"/>
<pin name="6" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="25" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas"/>
<pin name="7" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="26" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas"/>
<pin name="8" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="27" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas"/>
<pin name="9" x="7.62" y="0" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="28" x="-7.62" y="0" visible="pad" length="middle" direction="pas"/>
<pin name="10" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="29" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas"/>
<pin name="11" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="30" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas"/>
<pin name="12" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="31" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas"/>
<pin name="13" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="32" x="-7.62" y="-10.16" visible="pad" length="middle" direction="pas"/>
<pin name="14" x="7.62" y="-12.7" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="33" x="-7.62" y="-12.7" visible="pad" length="middle" direction="pas"/>
<pin name="15" x="7.62" y="-15.24" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="34" x="-7.62" y="-15.24" visible="pad" length="middle" direction="pas"/>
<pin name="16" x="7.62" y="-17.78" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="35" x="-7.62" y="-17.78" visible="pad" length="middle" direction="pas"/>
<pin name="17" x="7.62" y="-20.32" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="36" x="-7.62" y="-20.32" visible="pad" length="middle" direction="pas"/>
<pin name="18" x="7.62" y="-22.86" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="37" x="-7.62" y="-22.86" visible="pad" length="middle" direction="pas"/>
<pin name="19" x="7.62" y="-25.4" visible="pad" length="middle" direction="pas" rot="R180"/>
</symbol>
<symbol name="F37">
<wire x1="-1.651" y1="23.749" x2="-1.651" y2="21.971" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="21.971" x2="1.524" y2="23.749" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="21.209" x2="-1.651" y2="19.431" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="19.431" x2="1.524" y2="21.209" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="18.669" x2="-1.651" y2="16.891" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="16.891" x2="1.524" y2="18.669" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="16.129" x2="-1.651" y2="14.351" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="14.351" x2="1.524" y2="16.129" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="13.589" x2="-1.651" y2="11.811" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="11.811" x2="1.524" y2="13.589" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="11.049" x2="-1.651" y2="9.271" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="9.271" x2="1.524" y2="11.049" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="8.509" x2="-1.651" y2="6.731" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="6.731" x2="1.524" y2="8.509" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="5.969" x2="-1.651" y2="4.191" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="4.191" x2="1.524" y2="5.969" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="3.429" x2="-1.651" y2="1.651" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="1.651" x2="1.524" y2="3.429" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="0.889" x2="-1.651" y2="-0.889" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-0.889" x2="1.524" y2="0.889" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-1.651" x2="-1.651" y2="-3.429" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-3.429" x2="1.524" y2="-1.651" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-4.191" x2="-1.651" y2="-5.969" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-5.969" x2="1.524" y2="-4.191" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-6.731" x2="-1.651" y2="-8.509" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-8.509" x2="1.524" y2="-6.731" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-9.271" x2="-1.651" y2="-11.049" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-11.049" x2="1.524" y2="-9.271" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-11.811" x2="-1.651" y2="-13.589" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-13.589" x2="1.524" y2="-11.811" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-14.351" x2="-1.651" y2="-16.129" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-16.129" x2="1.524" y2="-14.351" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-16.891" x2="-1.651" y2="-18.669" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-18.669" x2="1.524" y2="-16.891" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-19.431" x2="-1.651" y2="-21.209" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="1.524" y1="-21.209" x2="1.524" y2="-19.431" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-1.651" y1="-21.971" x2="-1.651" y2="-23.749" width="0.254" layer="94" curve="180" cap="flat"/>
<wire x1="-4.064" y1="24.7112" x2="-2.5226" y2="25.952" width="0.4064" layer="94" curve="-102.324066" cap="flat"/>
<wire x1="-2.5226" y1="25.9518" x2="3.0654" y2="24.7294" width="0.4064" layer="94"/>
<wire x1="3.0654" y1="24.7295" x2="4.0642" y2="23.4888" width="0.4064" layer="94" curve="-77.655139" cap="flat"/>
<wire x1="4.064" y1="-23.4888" x2="4.064" y2="23.4888" width="0.4064" layer="94"/>
<wire x1="3.0654" y1="-24.7294" x2="4.064" y2="-23.4888" width="0.4064" layer="94" curve="77.657889"/>
<wire x1="-4.064" y1="-24.7112" x2="-4.064" y2="24.7112" width="0.4064" layer="94"/>
<wire x1="-2.5226" y1="-25.9518" x2="3.0654" y2="-24.7294" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="-24.7112" x2="-2.5226" y2="-25.9519" width="0.4064" layer="94" curve="102.337599" cap="flat"/>
<text x="-3.81" y="-28.575" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="26.67" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-7.62" y="22.86" visible="pad" length="middle" direction="pas"/>
<pin name="20" x="7.62" y="22.86" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="2" x="-7.62" y="20.32" visible="pad" length="middle" direction="pas"/>
<pin name="21" x="7.62" y="20.32" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="3" x="-7.62" y="17.78" visible="pad" length="middle" direction="pas"/>
<pin name="22" x="7.62" y="17.78" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="4" x="-7.62" y="15.24" visible="pad" length="middle" direction="pas"/>
<pin name="23" x="7.62" y="15.24" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="5" x="-7.62" y="12.7" visible="pad" length="middle" direction="pas"/>
<pin name="24" x="7.62" y="12.7" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="6" x="-7.62" y="10.16" visible="pad" length="middle" direction="pas"/>
<pin name="25" x="7.62" y="10.16" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="7" x="-7.62" y="7.62" visible="pad" length="middle" direction="pas"/>
<pin name="26" x="7.62" y="7.62" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="8" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas"/>
<pin name="27" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="9" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas"/>
<pin name="28" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="10" x="-7.62" y="0" visible="pad" length="middle" direction="pas"/>
<pin name="29" x="7.62" y="0" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="11" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas"/>
<pin name="30" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="12" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas"/>
<pin name="31" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="13" x="-7.62" y="-7.62" visible="pad" length="middle" direction="pas"/>
<pin name="32" x="7.62" y="-7.62" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="14" x="-7.62" y="-10.16" visible="pad" length="middle" direction="pas"/>
<pin name="33" x="7.62" y="-10.16" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="15" x="-7.62" y="-12.7" visible="pad" length="middle" direction="pas"/>
<pin name="34" x="7.62" y="-12.7" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="16" x="-7.62" y="-15.24" visible="pad" length="middle" direction="pas"/>
<pin name="35" x="7.62" y="-15.24" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="17" x="-7.62" y="-17.78" visible="pad" length="middle" direction="pas"/>
<pin name="36" x="7.62" y="-17.78" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="18" x="-7.62" y="-20.32" visible="pad" length="middle" direction="pas"/>
<pin name="37" x="7.62" y="-20.32" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="19" x="-7.62" y="-22.86" visible="pad" length="middle" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="M37" prefix="X" uservalue="yes">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="M37" x="0" y="0"/>
</gates>
<devices>
<device name="D" package="M37D">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="H" package="M37H">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HP" package="M37HP">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="V" package="M37V">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="VP" package="M37VP">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="VB" package="M37VB">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-182" package="182-037-MALE">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="SMT" package="M37SMT">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="F37" prefix="X" uservalue="yes">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<gates>
<gate name="-1" symbol="F37" x="0" y="0"/>
</gates>
<devices>
<device name="D" package="F37D">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="H" package="F37H">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="HP" package="F37HP">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="V" package="F37V">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="VP" package="F37VP">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="VB" package="F37VB">
<connects>
<connect gate="-1" pin="1" pad="1"/>
<connect gate="-1" pin="10" pad="10"/>
<connect gate="-1" pin="11" pad="11"/>
<connect gate="-1" pin="12" pad="12"/>
<connect gate="-1" pin="13" pad="13"/>
<connect gate="-1" pin="14" pad="14"/>
<connect gate="-1" pin="15" pad="15"/>
<connect gate="-1" pin="16" pad="16"/>
<connect gate="-1" pin="17" pad="17"/>
<connect gate="-1" pin="18" pad="18"/>
<connect gate="-1" pin="19" pad="19"/>
<connect gate="-1" pin="2" pad="2"/>
<connect gate="-1" pin="20" pad="20"/>
<connect gate="-1" pin="21" pad="21"/>
<connect gate="-1" pin="22" pad="22"/>
<connect gate="-1" pin="23" pad="23"/>
<connect gate="-1" pin="24" pad="24"/>
<connect gate="-1" pin="25" pad="25"/>
<connect gate="-1" pin="26" pad="26"/>
<connect gate="-1" pin="27" pad="27"/>
<connect gate="-1" pin="28" pad="28"/>
<connect gate="-1" pin="29" pad="29"/>
<connect gate="-1" pin="3" pad="3"/>
<connect gate="-1" pin="30" pad="30"/>
<connect gate="-1" pin="31" pad="31"/>
<connect gate="-1" pin="32" pad="32"/>
<connect gate="-1" pin="33" pad="33"/>
<connect gate="-1" pin="34" pad="34"/>
<connect gate="-1" pin="35" pad="35"/>
<connect gate="-1" pin="36" pad="36"/>
<connect gate="-1" pin="37" pad="37"/>
<connect gate="-1" pin="4" pad="4"/>
<connect gate="-1" pin="5" pad="5"/>
<connect gate="-1" pin="6" pad="6"/>
<connect gate="-1" pin="7" pad="7"/>
<connect gate="-1" pin="8" pad="8"/>
<connect gate="-1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X1" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X2" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X3" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X4" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X5" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X6" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X7" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X8" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X9" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X10" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X11" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X12" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X13" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X14" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X15" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X16" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X17" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X18" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X19" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X20" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X21" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X22" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X23" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X24" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X25" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X26" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X27" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X28" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X29" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X30" library="mayo" deviceset="22-23-2021" device=""/>
<part name="X33" library="con-subd" deviceset="M37" device="HP"/>
<part name="X34" library="con-subd" deviceset="F37" device="HP"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="X1" gate="-1" x="76.2" y="88.9" smashed="yes">
<attribute name="NAME" x="78.74" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="X2" gate="-1" x="76.2" y="83.82" smashed="yes">
<attribute name="NAME" x="78.74" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="X3" gate="-1" x="76.2" y="78.74" smashed="yes">
<attribute name="NAME" x="78.74" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="X4" gate="-1" x="76.2" y="73.66" smashed="yes">
<attribute name="NAME" x="78.74" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X5" gate="-1" x="76.2" y="68.58" smashed="yes">
<attribute name="NAME" x="78.74" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X6" gate="-1" x="76.2" y="63.5" smashed="yes">
<attribute name="NAME" x="78.74" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="X7" gate="-1" x="76.2" y="58.42" smashed="yes">
<attribute name="NAME" x="78.74" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X8" gate="-1" x="76.2" y="53.34" smashed="yes">
<attribute name="NAME" x="78.74" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="X9" gate="-1" x="76.2" y="48.26" smashed="yes">
<attribute name="NAME" x="78.74" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="X10" gate="-1" x="76.2" y="43.18" smashed="yes">
<attribute name="NAME" x="78.74" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="X11" gate="-1" x="76.2" y="38.1" smashed="yes">
<attribute name="NAME" x="78.74" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="X12" gate="-1" x="76.2" y="33.02" smashed="yes">
<attribute name="NAME" x="78.74" y="32.258" size="1.524" layer="95"/>
</instance>
<instance part="X13" gate="-1" x="76.2" y="27.94" smashed="yes">
<attribute name="NAME" x="78.74" y="27.178" size="1.524" layer="95"/>
</instance>
<instance part="X14" gate="-1" x="76.2" y="22.86" smashed="yes">
<attribute name="NAME" x="78.74" y="22.098" size="1.524" layer="95"/>
</instance>
<instance part="X15" gate="-1" x="76.2" y="17.78" smashed="yes">
<attribute name="NAME" x="78.74" y="17.018" size="1.524" layer="95"/>
</instance>
<instance part="X16" gate="-1" x="76.2" y="12.7" smashed="yes">
<attribute name="NAME" x="78.74" y="11.938" size="1.524" layer="95"/>
</instance>
<instance part="X17" gate="-1" x="76.2" y="7.62" smashed="yes">
<attribute name="NAME" x="78.74" y="6.858" size="1.524" layer="95"/>
</instance>
<instance part="X18" gate="-1" x="76.2" y="2.54" smashed="yes">
<attribute name="NAME" x="78.74" y="1.778" size="1.524" layer="95"/>
</instance>
<instance part="X19" gate="-1" x="76.2" y="-2.54" smashed="yes">
<attribute name="NAME" x="78.74" y="-3.302" size="1.524" layer="95"/>
</instance>
<instance part="X20" gate="-1" x="101.6" y="88.9" smashed="yes">
<attribute name="NAME" x="104.14" y="88.138" size="1.524" layer="95"/>
</instance>
<instance part="X21" gate="-1" x="101.6" y="83.82" smashed="yes">
<attribute name="NAME" x="104.14" y="83.058" size="1.524" layer="95"/>
</instance>
<instance part="X22" gate="-1" x="101.6" y="78.74" smashed="yes">
<attribute name="NAME" x="104.14" y="77.978" size="1.524" layer="95"/>
</instance>
<instance part="X23" gate="-1" x="101.6" y="73.66" smashed="yes">
<attribute name="NAME" x="104.14" y="72.898" size="1.524" layer="95"/>
</instance>
<instance part="X24" gate="-1" x="101.6" y="68.58" smashed="yes">
<attribute name="NAME" x="104.14" y="67.818" size="1.524" layer="95"/>
</instance>
<instance part="X25" gate="-1" x="101.6" y="63.5" smashed="yes">
<attribute name="NAME" x="104.14" y="62.738" size="1.524" layer="95"/>
</instance>
<instance part="X26" gate="-1" x="101.6" y="58.42" smashed="yes">
<attribute name="NAME" x="104.14" y="57.658" size="1.524" layer="95"/>
</instance>
<instance part="X27" gate="-1" x="101.6" y="53.34" smashed="yes">
<attribute name="NAME" x="104.14" y="52.578" size="1.524" layer="95"/>
</instance>
<instance part="X28" gate="-1" x="101.6" y="48.26" smashed="yes">
<attribute name="NAME" x="104.14" y="47.498" size="1.524" layer="95"/>
</instance>
<instance part="X29" gate="-1" x="101.6" y="43.18" smashed="yes">
<attribute name="NAME" x="104.14" y="42.418" size="1.524" layer="95"/>
</instance>
<instance part="X30" gate="-1" x="101.6" y="38.1" smashed="yes">
<attribute name="NAME" x="104.14" y="37.338" size="1.524" layer="95"/>
</instance>
<instance part="X33" gate="-1" x="27.94" y="45.72" smashed="yes">
<attribute name="VALUE" x="24.13" y="14.605" size="1.778" layer="96"/>
</instance>
<instance part="X34" gate="-1" x="139.7" y="43.18" smashed="yes">
<attribute name="VALUE" x="135.89" y="14.605" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="1" class="0">
<segment>
<pinref part="X33" gate="-1" pin="1"/>
<wire x1="35.56" y1="66.04" x2="45.72" y2="66.04" width="0.1524" layer="91"/>
<label x="45.72" y="66.04" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="73.66" y1="88.9" x2="71.12" y2="88.9" width="0.1524" layer="91"/>
<label x="71.12" y="88.9" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="1"/>
<wire x1="132.08" y1="66.04" x2="121.92" y2="66.04" width="0.1524" layer="91"/>
<label x="121.92" y="66.04" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="3" class="0">
<segment>
<pinref part="X33" gate="-1" pin="3"/>
<wire x1="35.56" y1="60.96" x2="45.72" y2="60.96" width="0.1524" layer="91"/>
<label x="45.72" y="60.96" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X3" gate="-1" pin="S"/>
<wire x1="73.66" y1="78.74" x2="71.12" y2="78.74" width="0.1524" layer="91"/>
<label x="71.12" y="78.74" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="3"/>
<wire x1="132.08" y1="60.96" x2="121.92" y2="60.96" width="0.1524" layer="91"/>
<label x="121.92" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="5" class="0">
<segment>
<pinref part="X33" gate="-1" pin="5"/>
<wire x1="35.56" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<label x="45.72" y="55.88" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X5" gate="-1" pin="S"/>
<wire x1="73.66" y1="68.58" x2="71.12" y2="68.58" width="0.1524" layer="91"/>
<label x="71.12" y="68.58" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="5"/>
<wire x1="132.08" y1="55.88" x2="121.92" y2="55.88" width="0.1524" layer="91"/>
<label x="121.92" y="55.88" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="7" class="0">
<segment>
<pinref part="X33" gate="-1" pin="7"/>
<wire x1="35.56" y1="50.8" x2="45.72" y2="50.8" width="0.1524" layer="91"/>
<label x="45.72" y="50.8" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X7" gate="-1" pin="S"/>
<wire x1="73.66" y1="58.42" x2="71.12" y2="58.42" width="0.1524" layer="91"/>
<label x="71.12" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="7"/>
<wire x1="132.08" y1="50.8" x2="121.92" y2="50.8" width="0.1524" layer="91"/>
<label x="121.92" y="50.8" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="9" class="0">
<segment>
<pinref part="X33" gate="-1" pin="9"/>
<wire x1="35.56" y1="45.72" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<label x="45.72" y="45.72" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X9" gate="-1" pin="S"/>
<wire x1="73.66" y1="48.26" x2="71.12" y2="48.26" width="0.1524" layer="91"/>
<label x="71.12" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="9"/>
<wire x1="132.08" y1="45.72" x2="121.92" y2="45.72" width="0.1524" layer="91"/>
<label x="121.92" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="11" class="0">
<segment>
<pinref part="X33" gate="-1" pin="11"/>
<wire x1="35.56" y1="40.64" x2="45.72" y2="40.64" width="0.1524" layer="91"/>
<label x="45.72" y="40.64" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X11" gate="-1" pin="S"/>
<wire x1="73.66" y1="38.1" x2="71.12" y2="38.1" width="0.1524" layer="91"/>
<label x="71.12" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="11"/>
<wire x1="132.08" y1="40.64" x2="121.92" y2="40.64" width="0.1524" layer="91"/>
<label x="121.92" y="40.64" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="13" class="0">
<segment>
<pinref part="X33" gate="-1" pin="13"/>
<wire x1="35.56" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<label x="45.72" y="35.56" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X13" gate="-1" pin="S"/>
<wire x1="73.66" y1="27.94" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
<label x="71.12" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="13"/>
<wire x1="132.08" y1="35.56" x2="121.92" y2="35.56" width="0.1524" layer="91"/>
<label x="121.92" y="35.56" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="15" class="0">
<segment>
<pinref part="X33" gate="-1" pin="15"/>
<wire x1="35.56" y1="30.48" x2="45.72" y2="30.48" width="0.1524" layer="91"/>
<label x="45.72" y="30.48" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X15" gate="-1" pin="S"/>
<wire x1="73.66" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<label x="71.12" y="17.78" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="15"/>
<wire x1="132.08" y1="30.48" x2="121.92" y2="30.48" width="0.1524" layer="91"/>
<label x="121.92" y="30.48" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="17" class="0">
<segment>
<pinref part="X33" gate="-1" pin="17"/>
<wire x1="35.56" y1="25.4" x2="45.72" y2="25.4" width="0.1524" layer="91"/>
<label x="45.72" y="25.4" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X17" gate="-1" pin="S"/>
<wire x1="73.66" y1="7.62" x2="71.12" y2="7.62" width="0.1524" layer="91"/>
<label x="71.12" y="7.62" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="17"/>
<wire x1="132.08" y1="25.4" x2="121.92" y2="25.4" width="0.1524" layer="91"/>
<label x="121.92" y="25.4" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="19" class="0">
<segment>
<pinref part="X33" gate="-1" pin="19"/>
<wire x1="35.56" y1="20.32" x2="45.72" y2="20.32" width="0.1524" layer="91"/>
<label x="45.72" y="20.32" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X19" gate="-1" pin="S"/>
<wire x1="73.66" y1="-2.54" x2="71.12" y2="-2.54" width="0.1524" layer="91"/>
<label x="71.12" y="-2.54" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="19"/>
<wire x1="132.08" y1="20.32" x2="121.92" y2="20.32" width="0.1524" layer="91"/>
<label x="121.92" y="20.32" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="2" class="0">
<segment>
<pinref part="X33" gate="-1" pin="2"/>
<wire x1="35.56" y1="63.5" x2="38.1" y2="63.5" width="0.1524" layer="91"/>
<label x="38.1" y="63.5" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X2" gate="-1" pin="S"/>
<wire x1="73.66" y1="83.82" x2="71.12" y2="83.82" width="0.1524" layer="91"/>
<label x="71.12" y="83.82" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="2"/>
<wire x1="132.08" y1="63.5" x2="129.54" y2="63.5" width="0.1524" layer="91"/>
<label x="129.54" y="63.5" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="4" class="0">
<segment>
<pinref part="X33" gate="-1" pin="4"/>
<wire x1="35.56" y1="58.42" x2="38.1" y2="58.42" width="0.1524" layer="91"/>
<label x="38.1" y="58.42" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="-1" pin="S"/>
<wire x1="73.66" y1="73.66" x2="71.12" y2="73.66" width="0.1524" layer="91"/>
<label x="71.12" y="73.66" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="4"/>
<wire x1="132.08" y1="58.42" x2="129.54" y2="58.42" width="0.1524" layer="91"/>
<label x="129.54" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="6" class="0">
<segment>
<pinref part="X33" gate="-1" pin="6"/>
<wire x1="35.56" y1="53.34" x2="38.1" y2="53.34" width="0.1524" layer="91"/>
<label x="38.1" y="53.34" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X6" gate="-1" pin="S"/>
<wire x1="73.66" y1="63.5" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
<label x="71.12" y="63.5" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="6"/>
<wire x1="132.08" y1="53.34" x2="129.54" y2="53.34" width="0.1524" layer="91"/>
<label x="129.54" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="8" class="0">
<segment>
<pinref part="X33" gate="-1" pin="8"/>
<wire x1="35.56" y1="48.26" x2="38.1" y2="48.26" width="0.1524" layer="91"/>
<label x="38.1" y="48.26" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X8" gate="-1" pin="S"/>
<wire x1="73.66" y1="53.34" x2="71.12" y2="53.34" width="0.1524" layer="91"/>
<label x="71.12" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="8"/>
<wire x1="132.08" y1="48.26" x2="129.54" y2="48.26" width="0.1524" layer="91"/>
<label x="129.54" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="10" class="0">
<segment>
<pinref part="X33" gate="-1" pin="10"/>
<wire x1="35.56" y1="43.18" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<label x="38.1" y="43.18" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X10" gate="-1" pin="S"/>
<wire x1="73.66" y1="43.18" x2="71.12" y2="43.18" width="0.1524" layer="91"/>
<label x="71.12" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="10"/>
<wire x1="132.08" y1="43.18" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<label x="129.54" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="12" class="0">
<segment>
<pinref part="X33" gate="-1" pin="12"/>
<wire x1="35.56" y1="38.1" x2="38.1" y2="38.1" width="0.1524" layer="91"/>
<label x="38.1" y="38.1" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X12" gate="-1" pin="S"/>
<wire x1="73.66" y1="33.02" x2="71.12" y2="33.02" width="0.1524" layer="91"/>
<label x="71.12" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="12"/>
<wire x1="132.08" y1="38.1" x2="129.54" y2="38.1" width="0.1524" layer="91"/>
<label x="129.54" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="14" class="0">
<segment>
<pinref part="X33" gate="-1" pin="14"/>
<wire x1="35.56" y1="33.02" x2="38.1" y2="33.02" width="0.1524" layer="91"/>
<label x="38.1" y="33.02" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X14" gate="-1" pin="S"/>
<wire x1="73.66" y1="22.86" x2="71.12" y2="22.86" width="0.1524" layer="91"/>
<label x="71.12" y="22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="14"/>
<wire x1="132.08" y1="33.02" x2="129.54" y2="33.02" width="0.1524" layer="91"/>
<label x="129.54" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="16" class="0">
<segment>
<pinref part="X33" gate="-1" pin="16"/>
<wire x1="35.56" y1="27.94" x2="38.1" y2="27.94" width="0.1524" layer="91"/>
<label x="38.1" y="27.94" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X16" gate="-1" pin="S"/>
<wire x1="73.66" y1="12.7" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<label x="71.12" y="12.7" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="16"/>
<wire x1="132.08" y1="27.94" x2="129.54" y2="27.94" width="0.1524" layer="91"/>
<label x="129.54" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="18" class="0">
<segment>
<pinref part="X33" gate="-1" pin="18"/>
<wire x1="35.56" y1="22.86" x2="38.1" y2="22.86" width="0.1524" layer="91"/>
<label x="38.1" y="22.86" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X18" gate="-1" pin="S"/>
<wire x1="73.66" y1="2.54" x2="71.12" y2="2.54" width="0.1524" layer="91"/>
<label x="71.12" y="2.54" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="18"/>
<wire x1="132.08" y1="22.86" x2="129.54" y2="22.86" width="0.1524" layer="91"/>
<label x="129.54" y="22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="20" class="0">
<segment>
<pinref part="X33" gate="-1" pin="20"/>
<wire x1="20.32" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<label x="17.78" y="66.04" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X20" gate="-1" pin="S"/>
<wire x1="99.06" y1="88.9" x2="96.52" y2="88.9" width="0.1524" layer="91"/>
<label x="96.52" y="88.9" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="20"/>
<wire x1="147.32" y1="66.04" x2="152.4" y2="66.04" width="0.1524" layer="91"/>
<label x="152.4" y="66.04" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="22" class="0">
<segment>
<pinref part="X33" gate="-1" pin="22"/>
<wire x1="20.32" y1="60.96" x2="17.78" y2="60.96" width="0.1524" layer="91"/>
<label x="17.78" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X22" gate="-1" pin="S"/>
<wire x1="99.06" y1="78.74" x2="96.52" y2="78.74" width="0.1524" layer="91"/>
<label x="96.52" y="78.74" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="22"/>
<wire x1="147.32" y1="60.96" x2="152.4" y2="60.96" width="0.1524" layer="91"/>
<label x="152.4" y="60.96" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="24" class="0">
<segment>
<pinref part="X33" gate="-1" pin="24"/>
<wire x1="20.32" y1="55.88" x2="17.78" y2="55.88" width="0.1524" layer="91"/>
<label x="17.78" y="55.88" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X24" gate="-1" pin="S"/>
<wire x1="99.06" y1="68.58" x2="96.52" y2="68.58" width="0.1524" layer="91"/>
<label x="96.52" y="68.58" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="24"/>
<wire x1="147.32" y1="55.88" x2="152.4" y2="55.88" width="0.1524" layer="91"/>
<label x="152.4" y="55.88" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="26" class="0">
<segment>
<pinref part="X33" gate="-1" pin="26"/>
<wire x1="20.32" y1="50.8" x2="17.78" y2="50.8" width="0.1524" layer="91"/>
<label x="17.78" y="50.8" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X26" gate="-1" pin="S"/>
<wire x1="99.06" y1="58.42" x2="96.52" y2="58.42" width="0.1524" layer="91"/>
<label x="96.52" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="26"/>
<wire x1="147.32" y1="50.8" x2="152.4" y2="50.8" width="0.1524" layer="91"/>
<label x="152.4" y="50.8" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="28" class="0">
<segment>
<pinref part="X33" gate="-1" pin="28"/>
<wire x1="20.32" y1="45.72" x2="17.78" y2="45.72" width="0.1524" layer="91"/>
<label x="17.78" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X28" gate="-1" pin="S"/>
<wire x1="99.06" y1="48.26" x2="96.52" y2="48.26" width="0.1524" layer="91"/>
<label x="96.52" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="28"/>
<wire x1="147.32" y1="45.72" x2="152.4" y2="45.72" width="0.1524" layer="91"/>
<label x="152.4" y="45.72" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="30" class="0">
<segment>
<pinref part="X33" gate="-1" pin="30"/>
<wire x1="20.32" y1="40.64" x2="17.78" y2="40.64" width="0.1524" layer="91"/>
<label x="17.78" y="40.64" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X30" gate="-1" pin="S"/>
<wire x1="99.06" y1="38.1" x2="96.52" y2="38.1" width="0.1524" layer="91"/>
<label x="96.52" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="30"/>
<wire x1="147.32" y1="40.64" x2="152.4" y2="40.64" width="0.1524" layer="91"/>
<label x="152.4" y="40.64" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<pinref part="X33" gate="-1" pin="32"/>
<wire x1="20.32" y1="35.56" x2="17.78" y2="35.56" width="0.1524" layer="91"/>
<label x="17.78" y="35.56" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="X33" gate="-1" pin="34"/>
<wire x1="20.32" y1="30.48" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
<label x="17.78" y="30.48" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="X33" gate="-1" pin="36"/>
<wire x1="20.32" y1="25.4" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
<label x="17.78" y="25.4" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="21" class="0">
<segment>
<pinref part="X33" gate="-1" pin="21"/>
<wire x1="20.32" y1="63.5" x2="12.7" y2="63.5" width="0.1524" layer="91"/>
<label x="12.7" y="63.5" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X21" gate="-1" pin="S"/>
<wire x1="99.06" y1="83.82" x2="96.52" y2="83.82" width="0.1524" layer="91"/>
<label x="96.52" y="83.82" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="21"/>
<wire x1="147.32" y1="63.5" x2="162.56" y2="63.5" width="0.1524" layer="91"/>
<label x="162.56" y="63.5" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="23" class="0">
<segment>
<pinref part="X33" gate="-1" pin="23"/>
<wire x1="20.32" y1="58.42" x2="12.7" y2="58.42" width="0.1524" layer="91"/>
<label x="12.7" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X23" gate="-1" pin="S"/>
<wire x1="99.06" y1="73.66" x2="96.52" y2="73.66" width="0.1524" layer="91"/>
<label x="96.52" y="73.66" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="23"/>
<wire x1="147.32" y1="58.42" x2="162.56" y2="58.42" width="0.1524" layer="91"/>
<label x="162.56" y="58.42" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="25" class="0">
<segment>
<pinref part="X33" gate="-1" pin="25"/>
<wire x1="20.32" y1="53.34" x2="12.7" y2="53.34" width="0.1524" layer="91"/>
<label x="12.7" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X25" gate="-1" pin="S"/>
<wire x1="99.06" y1="63.5" x2="96.52" y2="63.5" width="0.1524" layer="91"/>
<label x="96.52" y="63.5" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="25"/>
<wire x1="147.32" y1="53.34" x2="162.56" y2="53.34" width="0.1524" layer="91"/>
<label x="162.56" y="53.34" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="27" class="0">
<segment>
<pinref part="X33" gate="-1" pin="27"/>
<wire x1="20.32" y1="48.26" x2="12.7" y2="48.26" width="0.1524" layer="91"/>
<label x="12.7" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X27" gate="-1" pin="S"/>
<wire x1="99.06" y1="53.34" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
<label x="96.52" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="27"/>
<wire x1="147.32" y1="48.26" x2="162.56" y2="48.26" width="0.1524" layer="91"/>
<label x="162.56" y="48.26" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="29" class="0">
<segment>
<pinref part="X33" gate="-1" pin="29"/>
<wire x1="20.32" y1="43.18" x2="12.7" y2="43.18" width="0.1524" layer="91"/>
<label x="12.7" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X29" gate="-1" pin="S"/>
<wire x1="99.06" y1="43.18" x2="96.52" y2="43.18" width="0.1524" layer="91"/>
<label x="96.52" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X34" gate="-1" pin="29"/>
<wire x1="147.32" y1="43.18" x2="162.56" y2="43.18" width="0.1524" layer="91"/>
<label x="162.56" y="43.18" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="X33" gate="-1" pin="31"/>
<wire x1="20.32" y1="38.1" x2="12.7" y2="38.1" width="0.1524" layer="91"/>
<label x="12.7" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="X33" gate="-1" pin="33"/>
<wire x1="20.32" y1="33.02" x2="12.7" y2="33.02" width="0.1524" layer="91"/>
<label x="12.7" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$38" class="0">
<segment>
<pinref part="X33" gate="-1" pin="35"/>
<wire x1="20.32" y1="27.94" x2="12.7" y2="27.94" width="0.1524" layer="91"/>
<label x="12.7" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$39" class="0">
<segment>
<pinref part="X33" gate="-1" pin="37"/>
<wire x1="20.32" y1="22.86" x2="12.7" y2="22.86" width="0.1524" layer="91"/>
<label x="12.7" y="22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="N$68" class="0">
<segment>
<pinref part="X34" gate="-1" pin="31"/>
<wire x1="147.32" y1="38.1" x2="162.56" y2="38.1" width="0.1524" layer="91"/>
<label x="162.56" y="38.1" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$69" class="0">
<segment>
<pinref part="X34" gate="-1" pin="32"/>
<wire x1="147.32" y1="35.56" x2="152.4" y2="35.56" width="0.1524" layer="91"/>
<label x="152.4" y="35.56" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$70" class="0">
<segment>
<pinref part="X34" gate="-1" pin="33"/>
<wire x1="147.32" y1="33.02" x2="162.56" y2="33.02" width="0.1524" layer="91"/>
<label x="162.56" y="33.02" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$71" class="0">
<segment>
<pinref part="X34" gate="-1" pin="34"/>
<wire x1="147.32" y1="30.48" x2="152.4" y2="30.48" width="0.1524" layer="91"/>
<label x="152.4" y="30.48" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$72" class="0">
<segment>
<pinref part="X34" gate="-1" pin="35"/>
<wire x1="147.32" y1="27.94" x2="162.56" y2="27.94" width="0.1524" layer="91"/>
<label x="162.56" y="27.94" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$73" class="0">
<segment>
<pinref part="X34" gate="-1" pin="36"/>
<wire x1="147.32" y1="25.4" x2="152.4" y2="25.4" width="0.1524" layer="91"/>
<label x="152.4" y="25.4" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
<net name="N$74" class="0">
<segment>
<pinref part="X34" gate="-1" pin="37"/>
<wire x1="147.32" y1="22.86" x2="162.56" y2="22.86" width="0.1524" layer="91"/>
<label x="162.56" y="22.86" size="1.778" layer="95" xref="yes"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
