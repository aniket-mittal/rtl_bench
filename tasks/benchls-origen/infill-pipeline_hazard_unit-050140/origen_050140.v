module origen_050140 (
    input EX_MemR, EX_RegW,
    input [4:0] EX_WeSel,
    input MEM_MemR, MEM_RegW,
    input [4:0] MEM_WeSel,
    input [4:0] ID_oprs, ID_oprt,
    input ID_Branch, ID_BranchNE, ID_jump,
    input [1:0] ID_pcSel,
    input EX_Branch, EX_BranchNE, EX_jump,
    output reg Wr_PC, Wr_IFID, Wr_IDEX, Wr_EXMEM, Wr_MEMWB,
    output reg ClearCtrl_IDEX, ClearCtrl_EXMEM, ClearCtrl_MEMWB,
    output reg Bubble
);

    wire load_use_hazard, data_hazard_branch, control_hazard;

    // Load-Use Hazard
    assign load_use_hazard = EX_MemR && (EX_WeSel == ID_oprs || EX_WeSel == ID_oprt);

    // Data Hazard with Branches/Jumps
    assign data_hazard_branch = (ID_Branch || ID_BranchNE || ID_jump) &&
                                ((EX_RegW && (EX_WeSel == ID_oprs || EX_WeSel == ID_oprt)) ||
                                 (MEM_RegW && (MEM_WeSel == ID_oprs || MEM_WeSel == ID_oprt)));

    // Control Hazard
    assign control_hazard = EX_Branch || EX_BranchNE || EX_jump;

    [MASKED]

endmodule