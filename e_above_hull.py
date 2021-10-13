import json
from pymatgen.apps.borg.hive import VaspToComputedEntryDrone
from pymatgen.apps.borg.queen import BorgQueen
from pymatgen.io.vasp.outputs import Outcar
from pymatgen.analysis.phase_diagram import PhaseDiagram
from pymatgen.analysis.phase_diagram import PDPlotter
from pymatgen.entries.compatibility import MaterialsProjectCompatibility
from pymatgen.ext.matproj import MPRester

para = ["is_hubbard", "hubbards","potcar_symbols", "run_type","structures","efermi","is_spin","potcar_spec","atomic_symbols"]#,"get_computed_entry"]#"potcar_spec"
dat = ["final_energy"]
etry = VaspToComputedEntryDrone(parameters = para,data = dat)
#entry.assimilate(a)#.to_json())
path = "./"
queen = BorgQueen(etry,rootpath=path,number_of_drones=1)
#queen.serial_assimilate(path)
entries = queen.get_data()
#save_data = queen.save_data('entry_save.txt')
#entries = queen.load_data('entry_save.json')
#print("entries:",entries)
#print("enrty0:",entries[0])
#print("entries:",dir(entries[0]))
a=MPRester("mqzy3IaxSNegF941")
compat = MaterialsProjectCompatibility()
computed_entries = compat.process_entries(entries)
#print("len_computed_entries:",len(computed_entries))
elements = [ ]
for entry in computed_entries:
    #print("entry.as_dict():",entry.as_dict()[u'parameters'][u'atomic_symbols'])
    #print("set(entry.as_dict():",set(entry.as_dict()[u'parameters'][u'atomic_symbols']))
    element = list(set(entry.as_dict()[u'parameters'][u'atomic_symbols']))
    #print("list(set(entry.as_dict():)",element)
    s = [ ]
    for i in range(len(element)):
        s.append(str(element[i]))
    elements.append(s)#json.dumps(#.get_reduced_composition_and_factor#[u'atomic_symbols']#composition.reduced_composition#.atomic_symbols
#print(elements)
ss=[]
for element in elements:
    for i in range(len(element)):
        ss.append(element[i])
ss = list(set(ss))
mp_entries = a.get_entries_in_chemsys(ss)
total_entries = computed_entries+mp_entries
pd = PhaseDiagram(total_entries)
for i in range(len(computed_entries)):
    decomp,e_above_hull = pd.get_decomp_and_e_above_hull(computed_entries[i])
    print("name and ebh:",(computed_entries[i].name,e_above_hull))
