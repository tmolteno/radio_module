kikit panelize \
    --layout 'alternation: cols; hspace: 2mm; vspace: 2mm; rotation: 180deg; rows: 3; cols: 2' \
    --tabs 'type: fixed; vwidth: 10mm; hwidth: 10mm; vcount: 2; hcount: 2' \
    --cuts 'type: vcuts' \
    --framing 'type: railstb; mintotalheight: 100mm; width: 5mm' \
    --fiducials 'type: 4fid; hoffset: 10mm; voffset: 3.35mm; coppersize: 1mm; opening: 2mm' \
    --tooling 'type: 3hole; hoffset: 5mm; voffset: 2.5mm; size: 1.152mm; solderMaskMargin: 1.3mm' \
    --text 'type: simple; voffset: 2.5mm; text: TART Radio Module Set' \
    --post 'millradius: 0.5mm' \
    ufl_radio.kicad_pcb panelized_radios.kicad_pcb



