module ctrl_dec(clk, rst, ctrl, sel, ud_t, ld_t, ud_ce, ld_ce, addr);
    input            clk;        
    input            rst;        
    input    [15:0]  ctrl;        
    input            sel;        
    output           ud_t;        
    output           ld_t;        
    output           ud_ce;        
    output           ld_ce;        
    output   [4:0]   addr;        

    reg              ud_t, ld_t, ud_ce, ld_ce;


    wire       ud_t_nxt, ld_t_nxt, ud_ce_nxt, ld_ce_nxt, mem_ce, selio;
    wire [4:0] addr;

    assign { ud_t_nxt, ld_t_nxt, ud_ce_nxt, ld_ce_nxt, mem_ce, selio, addr }
        = ctrl[11:1];

    [MASKED]

endmodule