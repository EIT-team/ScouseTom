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
</packages>
<symbols>
<symbol name="M37G">
<wire x1="0" y1="22.86" x2="-2.54" y2="22.86" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-27.94" x2="0" y2="-27.94" width="0.1524" layer="94"/>
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
<wire x1="2.5226" y1="-28.4918" x2="0" y2="-27.94" width="0.4064" layer="94"/>
<wire x1="0" y1="-27.94" x2="-3.0654" y2="-27.2694" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="-26.0288" x2="-3.0654" y2="-27.2694" width="0.4064" layer="94" curve="77.657889"/>
<wire x1="-4.064" y1="20.9488" x2="-4.064" y2="-26.0288" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="20.9488" x2="-3.0654" y2="22.1894" width="0.4064" layer="94" curve="-77.657889"/>
<wire x1="4.064" y1="22.1712" x2="4.064" y2="-27.2512" width="0.4064" layer="94"/>
<wire x1="2.5226" y1="23.4118" x2="0" y2="22.86" width="0.4064" layer="94"/>
<wire x1="0" y1="22.86" x2="-3.0654" y2="22.1894" width="0.4064" layer="94"/>
<wire x1="2.5226" y1="23.4119" x2="4.064" y2="22.1712" width="0.4064" layer="94" curve="-102.337599" cap="flat"/>
<circle x="0" y="22.86" radius="0.254" width="0.6096" layer="94"/>
<circle x="0" y="-27.94" radius="0.254" width="0.6096" layer="94"/>
<text x="-3.81" y="24.13" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-31.115" size="1.778" layer="96">&gt;VALUE</text>
<pin name="G1" x="-7.62" y="22.86" visible="pad" length="middle" direction="pas"/>
<pin name="G2" x="-7.62" y="-27.94" visible="pad" length="middle" direction="pas"/>
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
<symbol name="F37G">
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
<wire x1="-2.5226" y1="25.9518" x2="0" y2="25.4" width="0.4064" layer="94"/>
<wire x1="0" y1="25.4" x2="3.0654" y2="24.7294" width="0.4064" layer="94"/>
<wire x1="3.0654" y1="24.7295" x2="4.0642" y2="23.4888" width="0.4064" layer="94" curve="-77.655139" cap="flat"/>
<wire x1="4.064" y1="-23.4888" x2="4.064" y2="23.4888" width="0.4064" layer="94"/>
<wire x1="3.0654" y1="-24.7294" x2="4.064" y2="-23.4888" width="0.4064" layer="94" curve="77.657889"/>
<wire x1="-4.064" y1="-24.7112" x2="-4.064" y2="24.7112" width="0.4064" layer="94"/>
<wire x1="-2.5226" y1="-25.9518" x2="0" y2="-25.4" width="0.4064" layer="94"/>
<wire x1="0" y1="-25.4" x2="3.0654" y2="-24.7294" width="0.4064" layer="94"/>
<wire x1="-4.064" y1="-24.7112" x2="-2.5226" y2="-25.9519" width="0.4064" layer="94" curve="102.337599" cap="flat"/>
<wire x1="2.54" y1="25.4" x2="0" y2="25.4" width="0.1524" layer="94"/>
<wire x1="0" y1="-25.4" x2="2.54" y2="-25.4" width="0.1524" layer="94"/>
<circle x="0" y="25.4" radius="0.254" width="0.6096" layer="94"/>
<circle x="0" y="-25.4" radius="0.254" width="0.6096" layer="94"/>
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
<pin name="G1" x="7.62" y="25.4" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="G2" x="7.62" y="-25.4" visible="pad" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="M37HP" prefix="X" uservalue="yes">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="M37G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="M37HP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="27" pad="27"/>
<connect gate="G$1" pin="28" pad="28"/>
<connect gate="G$1" pin="29" pad="29"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="30" pad="30"/>
<connect gate="G$1" pin="31" pad="31"/>
<connect gate="G$1" pin="32" pad="32"/>
<connect gate="G$1" pin="33" pad="33"/>
<connect gate="G$1" pin="34" pad="34"/>
<connect gate="G$1" pin="35" pad="35"/>
<connect gate="G$1" pin="36" pad="36"/>
<connect gate="G$1" pin="37" pad="37"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="G1" pad="G1"/>
<connect gate="G$1" pin="G2" pad="G2"/>
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
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="27" pad="27"/>
<connect gate="G$1" pin="28" pad="28"/>
<connect gate="G$1" pin="29" pad="29"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="30" pad="30"/>
<connect gate="G$1" pin="31" pad="31"/>
<connect gate="G$1" pin="32" pad="32"/>
<connect gate="G$1" pin="33" pad="33"/>
<connect gate="G$1" pin="34" pad="34"/>
<connect gate="G$1" pin="35" pad="35"/>
<connect gate="G$1" pin="36" pad="36"/>
<connect gate="G$1" pin="37" pad="37"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="G1" pad="S@1"/>
<connect gate="G$1" pin="G2" pad="S@2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="F37HP" prefix="X" uservalue="yes">
<description>&lt;b&gt;SUB-D&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="F37G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="F37HP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
<connect gate="G$1" pin="17" pad="17"/>
<connect gate="G$1" pin="18" pad="18"/>
<connect gate="G$1" pin="19" pad="19"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="20" pad="20"/>
<connect gate="G$1" pin="21" pad="21"/>
<connect gate="G$1" pin="22" pad="22"/>
<connect gate="G$1" pin="23" pad="23"/>
<connect gate="G$1" pin="24" pad="24"/>
<connect gate="G$1" pin="25" pad="25"/>
<connect gate="G$1" pin="26" pad="26"/>
<connect gate="G$1" pin="27" pad="27"/>
<connect gate="G$1" pin="28" pad="28"/>
<connect gate="G$1" pin="29" pad="29"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="30" pad="30"/>
<connect gate="G$1" pin="31" pad="31"/>
<connect gate="G$1" pin="32" pad="32"/>
<connect gate="G$1" pin="33" pad="33"/>
<connect gate="G$1" pin="34" pad="34"/>
<connect gate="G$1" pin="35" pad="35"/>
<connect gate="G$1" pin="36" pad="36"/>
<connect gate="G$1" pin="37" pad="37"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
<connect gate="G$1" pin="G1" pad="G1"/>
<connect gate="G$1" pin="G2" pad="G2"/>
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
<part name="X3" library="con-subd" deviceset="M37HP" device=""/>
<part name="X4" library="con-subd" deviceset="M37HP" device=""/>
<part name="X1" library="con-subd" deviceset="F37HP" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="X3" gate="G$1" x="22.86" y="38.1" rot="R180"/>
<instance part="X4" gate="G$1" x="76.2" y="-5.08" rot="R270"/>
<instance part="X1" gate="G$1" x="119.38" y="40.64" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="19" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="19"/>
<wire x1="15.24" y1="63.5" x2="5.08" y2="63.5" width="0.1524" layer="91"/>
<label x="5.08" y="63.5" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="19"/>
<wire x1="127" y1="63.5" x2="137.16" y2="63.5" width="0.1524" layer="91"/>
<label x="137.16" y="63.5" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="19"/>
<wire x1="50.8" y1="-12.7" x2="50.8" y2="-15.24" width="0.1524" layer="91"/>
<label x="50.8" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="18" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="18"/>
<wire x1="15.24" y1="60.96" x2="12.7" y2="60.96" width="0.1524" layer="91"/>
<label x="12.7" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="18"/>
<wire x1="127" y1="60.96" x2="129.54" y2="60.96" width="0.1524" layer="91"/>
<label x="129.54" y="60.96" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="18"/>
<wire x1="53.34" y1="-12.7" x2="53.34" y2="-20.32" width="0.1524" layer="91"/>
<label x="53.34" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="17" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="17"/>
<wire x1="15.24" y1="58.42" x2="5.08" y2="58.42" width="0.1524" layer="91"/>
<label x="5.08" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="17"/>
<wire x1="127" y1="58.42" x2="137.16" y2="58.42" width="0.1524" layer="91"/>
<label x="137.16" y="58.42" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="17"/>
<wire x1="55.88" y1="-12.7" x2="55.88" y2="-15.24" width="0.1524" layer="91"/>
<label x="55.88" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="16" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="16"/>
<wire x1="15.24" y1="55.88" x2="12.7" y2="55.88" width="0.1524" layer="91"/>
<label x="12.7" y="55.88" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="16"/>
<wire x1="127" y1="55.88" x2="129.54" y2="55.88" width="0.1524" layer="91"/>
<label x="129.54" y="55.88" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="16"/>
<wire x1="58.42" y1="-12.7" x2="58.42" y2="-20.32" width="0.1524" layer="91"/>
<label x="58.42" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="15" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="15"/>
<wire x1="15.24" y1="53.34" x2="5.08" y2="53.34" width="0.1524" layer="91"/>
<label x="5.08" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="15"/>
<wire x1="127" y1="53.34" x2="137.16" y2="53.34" width="0.1524" layer="91"/>
<label x="137.16" y="53.34" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="15"/>
<wire x1="60.96" y1="-12.7" x2="60.96" y2="-15.24" width="0.1524" layer="91"/>
<label x="60.96" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="14" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="14"/>
<wire x1="15.24" y1="50.8" x2="12.7" y2="50.8" width="0.1524" layer="91"/>
<label x="12.7" y="50.8" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="14"/>
<wire x1="127" y1="50.8" x2="129.54" y2="50.8" width="0.1524" layer="91"/>
<label x="129.54" y="50.8" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="14"/>
<wire x1="63.5" y1="-12.7" x2="63.5" y2="-20.32" width="0.1524" layer="91"/>
<label x="63.5" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="13" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="13"/>
<wire x1="15.24" y1="48.26" x2="5.08" y2="48.26" width="0.1524" layer="91"/>
<label x="5.08" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="13"/>
<wire x1="127" y1="48.26" x2="137.16" y2="48.26" width="0.1524" layer="91"/>
<label x="137.16" y="48.26" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="13"/>
<wire x1="66.04" y1="-12.7" x2="66.04" y2="-15.24" width="0.1524" layer="91"/>
<label x="66.04" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="12" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="12"/>
<wire x1="15.24" y1="45.72" x2="12.7" y2="45.72" width="0.1524" layer="91"/>
<label x="12.7" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="12"/>
<wire x1="127" y1="45.72" x2="129.54" y2="45.72" width="0.1524" layer="91"/>
<label x="129.54" y="45.72" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="12"/>
<wire x1="68.58" y1="-12.7" x2="68.58" y2="-20.32" width="0.1524" layer="91"/>
<label x="68.58" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="11" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="11"/>
<wire x1="15.24" y1="43.18" x2="5.08" y2="43.18" width="0.1524" layer="91"/>
<label x="5.08" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="11"/>
<wire x1="127" y1="43.18" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<label x="137.16" y="43.18" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="11"/>
<wire x1="71.12" y1="-12.7" x2="71.12" y2="-15.24" width="0.1524" layer="91"/>
<label x="71.12" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="10" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="10"/>
<wire x1="15.24" y1="40.64" x2="12.7" y2="40.64" width="0.1524" layer="91"/>
<label x="12.7" y="40.64" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="10"/>
<wire x1="127" y1="40.64" x2="129.54" y2="40.64" width="0.1524" layer="91"/>
<label x="129.54" y="40.64" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="10"/>
<wire x1="73.66" y1="-12.7" x2="73.66" y2="-20.32" width="0.1524" layer="91"/>
<label x="73.66" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="9" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="9"/>
<wire x1="15.24" y1="38.1" x2="5.08" y2="38.1" width="0.1524" layer="91"/>
<label x="5.08" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="9"/>
<wire x1="127" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
<label x="137.16" y="38.1" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="9"/>
<wire x1="76.2" y1="-12.7" x2="76.2" y2="-15.24" width="0.1524" layer="91"/>
<label x="76.2" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="8" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="8"/>
<wire x1="15.24" y1="35.56" x2="12.7" y2="35.56" width="0.1524" layer="91"/>
<label x="12.7" y="35.56" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="8"/>
<wire x1="127" y1="35.56" x2="132.08" y2="35.56" width="0.1524" layer="91"/>
<label x="132.08" y="35.56" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="8"/>
<wire x1="78.74" y1="-12.7" x2="78.74" y2="-20.32" width="0.1524" layer="91"/>
<label x="78.74" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="7" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="7"/>
<wire x1="15.24" y1="33.02" x2="5.08" y2="33.02" width="0.1524" layer="91"/>
<label x="5.08" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="7"/>
<wire x1="127" y1="33.02" x2="137.16" y2="33.02" width="0.1524" layer="91"/>
<label x="137.16" y="33.02" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="7"/>
<wire x1="81.28" y1="-12.7" x2="81.28" y2="-15.24" width="0.1524" layer="91"/>
<label x="81.28" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="5" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="5"/>
<wire x1="15.24" y1="27.94" x2="5.08" y2="27.94" width="0.1524" layer="91"/>
<label x="5.08" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="5"/>
<wire x1="127" y1="27.94" x2="137.16" y2="27.94" width="0.1524" layer="91"/>
<label x="137.16" y="27.94" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="5"/>
<wire x1="86.36" y1="-12.7" x2="86.36" y2="-15.24" width="0.1524" layer="91"/>
<label x="86.36" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="4" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="4"/>
<wire x1="15.24" y1="25.4" x2="12.7" y2="25.4" width="0.1524" layer="91"/>
<label x="12.7" y="25.4" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="4"/>
<wire x1="127" y1="25.4" x2="129.54" y2="25.4" width="0.1524" layer="91"/>
<label x="129.54" y="25.4" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="4"/>
<wire x1="88.9" y1="-12.7" x2="88.9" y2="-20.32" width="0.1524" layer="91"/>
<label x="88.9" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="3" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="3"/>
<wire x1="15.24" y1="22.86" x2="5.08" y2="22.86" width="0.1524" layer="91"/>
<label x="5.08" y="22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="3"/>
<wire x1="127" y1="22.86" x2="137.16" y2="22.86" width="0.1524" layer="91"/>
<label x="137.16" y="22.86" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="3"/>
<wire x1="91.44" y1="-12.7" x2="91.44" y2="-15.24" width="0.1524" layer="91"/>
<label x="91.44" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="2" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="2"/>
<wire x1="15.24" y1="20.32" x2="12.7" y2="20.32" width="0.1524" layer="91"/>
<label x="12.7" y="20.32" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<wire x1="127" y1="20.32" x2="129.54" y2="20.32" width="0.1524" layer="91"/>
<label x="129.54" y="20.32" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="2"/>
<wire x1="93.98" y1="-12.7" x2="93.98" y2="-20.32" width="0.1524" layer="91"/>
<label x="93.98" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="1" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="1"/>
<wire x1="15.24" y1="17.78" x2="5.08" y2="17.78" width="0.1524" layer="91"/>
<label x="5.08" y="17.78" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="127" y1="17.78" x2="137.16" y2="17.78" width="0.1524" layer="91"/>
<label x="137.16" y="17.78" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="1"/>
<wire x1="96.52" y1="-12.7" x2="96.52" y2="-15.24" width="0.1524" layer="91"/>
<label x="96.52" y="-15.24" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="20" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="20"/>
<wire x1="30.48" y1="17.78" x2="33.02" y2="17.78" width="0.1524" layer="91"/>
<label x="33.02" y="17.78" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="20"/>
<wire x1="96.52" y1="2.54" x2="96.52" y2="5.08" width="0.1524" layer="91"/>
<label x="96.52" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="20"/>
<wire x1="111.76" y1="17.78" x2="109.22" y2="17.78" width="0.1524" layer="91"/>
<label x="109.22" y="17.78" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="21" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="21"/>
<wire x1="30.48" y1="20.32" x2="40.64" y2="20.32" width="0.1524" layer="91"/>
<label x="40.64" y="20.32" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="21"/>
<wire x1="111.76" y1="20.32" x2="104.14" y2="20.32" width="0.1524" layer="91"/>
<label x="104.14" y="20.32" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="21"/>
<wire x1="93.98" y1="2.54" x2="93.98" y2="10.16" width="0.1524" layer="91"/>
<label x="93.98" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="23" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="23"/>
<wire x1="30.48" y1="25.4" x2="40.64" y2="25.4" width="0.1524" layer="91"/>
<label x="40.64" y="25.4" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="23"/>
<wire x1="111.76" y1="25.4" x2="104.14" y2="25.4" width="0.1524" layer="91"/>
<label x="104.14" y="25.4" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="23"/>
<wire x1="88.9" y1="2.54" x2="88.9" y2="10.16" width="0.1524" layer="91"/>
<label x="88.9" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="25" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="25"/>
<wire x1="30.48" y1="30.48" x2="40.64" y2="30.48" width="0.1524" layer="91"/>
<label x="40.64" y="30.48" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="25"/>
<wire x1="111.76" y1="30.48" x2="104.14" y2="30.48" width="0.1524" layer="91"/>
<label x="104.14" y="30.48" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="25"/>
<wire x1="83.82" y1="2.54" x2="83.82" y2="10.16" width="0.1524" layer="91"/>
<label x="83.82" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="26" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="26"/>
<wire x1="30.48" y1="33.02" x2="33.02" y2="33.02" width="0.1524" layer="91"/>
<label x="33.02" y="33.02" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="26"/>
<wire x1="111.76" y1="33.02" x2="109.22" y2="33.02" width="0.1524" layer="91"/>
<label x="109.22" y="33.02" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="26"/>
<wire x1="81.28" y1="2.54" x2="81.28" y2="5.08" width="0.1524" layer="91"/>
<label x="81.28" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="27" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="27"/>
<wire x1="30.48" y1="35.56" x2="40.64" y2="35.56" width="0.1524" layer="91"/>
<label x="40.64" y="35.56" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="27"/>
<wire x1="111.76" y1="35.56" x2="104.14" y2="35.56" width="0.1524" layer="91"/>
<label x="104.14" y="35.56" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="27"/>
<wire x1="78.74" y1="2.54" x2="78.74" y2="10.16" width="0.1524" layer="91"/>
<label x="78.74" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="28" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="28"/>
<wire x1="30.48" y1="38.1" x2="33.02" y2="38.1" width="0.1524" layer="91"/>
<label x="33.02" y="38.1" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="28"/>
<wire x1="111.76" y1="38.1" x2="109.22" y2="38.1" width="0.1524" layer="91"/>
<label x="109.22" y="38.1" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="28"/>
<wire x1="76.2" y1="2.54" x2="76.2" y2="5.08" width="0.1524" layer="91"/>
<label x="76.2" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="29" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="29"/>
<wire x1="30.48" y1="40.64" x2="40.64" y2="40.64" width="0.1524" layer="91"/>
<label x="40.64" y="40.64" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="29"/>
<wire x1="111.76" y1="40.64" x2="104.14" y2="40.64" width="0.1524" layer="91"/>
<label x="104.14" y="40.64" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="29"/>
<wire x1="73.66" y1="2.54" x2="73.66" y2="10.16" width="0.1524" layer="91"/>
<label x="73.66" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="30" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="30"/>
<wire x1="30.48" y1="43.18" x2="33.02" y2="43.18" width="0.1524" layer="91"/>
<label x="33.02" y="43.18" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="30"/>
<wire x1="111.76" y1="43.18" x2="109.22" y2="43.18" width="0.1524" layer="91"/>
<label x="109.22" y="43.18" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="30"/>
<wire x1="71.12" y1="2.54" x2="71.12" y2="5.08" width="0.1524" layer="91"/>
<label x="71.12" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="31" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="31"/>
<wire x1="30.48" y1="45.72" x2="40.64" y2="45.72" width="0.1524" layer="91"/>
<label x="40.64" y="45.72" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="31"/>
<wire x1="111.76" y1="45.72" x2="104.14" y2="45.72" width="0.1524" layer="91"/>
<label x="104.14" y="45.72" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="31"/>
<wire x1="68.58" y1="2.54" x2="68.58" y2="10.16" width="0.1524" layer="91"/>
<label x="68.58" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="32" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="32"/>
<wire x1="30.48" y1="48.26" x2="33.02" y2="48.26" width="0.1524" layer="91"/>
<label x="33.02" y="48.26" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="32"/>
<wire x1="111.76" y1="48.26" x2="109.22" y2="48.26" width="0.1524" layer="91"/>
<label x="109.22" y="48.26" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="32"/>
<wire x1="66.04" y1="2.54" x2="66.04" y2="5.08" width="0.1524" layer="91"/>
<label x="66.04" y="5.08" size="1.778" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="33" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="33"/>
<wire x1="30.48" y1="50.8" x2="40.64" y2="50.8" width="0.1524" layer="91"/>
<label x="40.64" y="50.8" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="33"/>
<wire x1="111.76" y1="50.8" x2="104.14" y2="50.8" width="0.1524" layer="91"/>
<label x="104.14" y="50.8" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="33"/>
<wire x1="63.5" y1="2.54" x2="63.5" y2="10.16" width="0.1524" layer="91"/>
<label x="63.5" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="34" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="34"/>
<wire x1="30.48" y1="53.34" x2="33.02" y2="53.34" width="0.1524" layer="91"/>
<label x="33.02" y="53.34" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="34"/>
<wire x1="111.76" y1="53.34" x2="109.22" y2="53.34" width="0.1524" layer="91"/>
<label x="109.22" y="53.34" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="34"/>
<wire x1="60.96" y1="2.54" x2="60.96" y2="5.08" width="0.1524" layer="91"/>
<label x="60.96" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="35" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="35"/>
<wire x1="30.48" y1="55.88" x2="40.64" y2="55.88" width="0.1524" layer="91"/>
<label x="40.64" y="55.88" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="35"/>
<wire x1="111.76" y1="55.88" x2="104.14" y2="55.88" width="0.1524" layer="91"/>
<label x="104.14" y="55.88" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="35"/>
<wire x1="58.42" y1="2.54" x2="58.42" y2="10.16" width="0.1524" layer="91"/>
<label x="58.42" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="36" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="36"/>
<wire x1="30.48" y1="58.42" x2="33.02" y2="58.42" width="0.1524" layer="91"/>
<label x="33.02" y="58.42" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="36"/>
<wire x1="111.76" y1="58.42" x2="109.22" y2="58.42" width="0.1524" layer="91"/>
<label x="109.22" y="58.42" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="36"/>
<wire x1="55.88" y1="2.54" x2="55.88" y2="5.08" width="0.1524" layer="91"/>
<label x="55.88" y="5.08" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="37" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="37"/>
<wire x1="30.48" y1="60.96" x2="40.64" y2="60.96" width="0.1524" layer="91"/>
<label x="40.64" y="60.96" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="37"/>
<wire x1="111.76" y1="60.96" x2="104.14" y2="60.96" width="0.1524" layer="91"/>
<label x="104.14" y="60.96" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="37"/>
<wire x1="53.34" y1="2.54" x2="53.34" y2="10.16" width="0.1524" layer="91"/>
<label x="53.34" y="10.16" size="1.778" layer="95" rot="MR90" xref="yes"/>
</segment>
</net>
<net name="6" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="6"/>
<wire x1="15.24" y1="30.48" x2="12.7" y2="30.48" width="0.1524" layer="91"/>
<label x="12.7" y="30.48" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="6"/>
<wire x1="127" y1="30.48" x2="129.54" y2="30.48" width="0.1524" layer="91"/>
<label x="129.54" y="30.48" size="1.778" layer="95" rot="MR180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="6"/>
<wire x1="83.82" y1="-12.7" x2="83.82" y2="-20.32" width="0.1524" layer="91"/>
<label x="83.82" y="-20.32" size="1.778" layer="95" rot="MR270" xref="yes"/>
</segment>
</net>
<net name="22" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="22"/>
<wire x1="30.48" y1="22.86" x2="33.02" y2="22.86" width="0.1524" layer="91"/>
<label x="33.02" y="22.86" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="22"/>
<wire x1="111.76" y1="22.86" x2="109.22" y2="22.86" width="0.1524" layer="91"/>
<label x="109.22" y="22.86" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="22"/>
<wire x1="91.44" y1="2.54" x2="91.44" y2="5.08" width="0.1524" layer="91"/>
<label x="91.44" y="5.08" size="1.778" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
<net name="24" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="24"/>
<wire x1="30.48" y1="27.94" x2="33.02" y2="27.94" width="0.1524" layer="91"/>
<label x="33.02" y="27.94" size="1.778" layer="95" xref="yes"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="24"/>
<wire x1="111.76" y1="27.94" x2="109.22" y2="27.94" width="0.1524" layer="91"/>
<label x="109.22" y="27.94" size="1.778" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="24"/>
<wire x1="86.36" y1="2.54" x2="86.36" y2="5.08" width="0.1524" layer="91"/>
<label x="86.36" y="5.08" size="1.778" layer="95" rot="R90" xref="yes"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
