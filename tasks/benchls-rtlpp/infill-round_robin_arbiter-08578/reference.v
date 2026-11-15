module rtlpp_08578(
    clock,
    rst,
    req4,
    req3,
    req2,
    req1,
    req0,
    gnt4,
    gnt3,
    gnt2,
    gnt1,
    gnt0
);
parameter N = 5;
input  clock;
input  rst;
input  req4;
input  req3;
input  req2;
input  req1;
input  req0;
output gnt4;
output gnt3;
output gnt2;
output gnt1;
output gnt0;

reg  [N-1:0] pointer_reg;
wire [N-1:0] req;

assign req = {req4, req3, req2, req1, req0};

wire  [N-1:0] gnt;

assign gnt4 = gnt[4];
assign gnt3 = gnt[3];
assign gnt2 = gnt[2];
assign gnt1 = gnt[1];
assign gnt0 = gnt[0];

wire [N-1:0] req_masked;
wire [N-1:0] mask_higher_pri_regs;
wire [N-1:0] gnt_masked;

assign req_masked = req & pointer_reg; 

assign mask_higher_pri_regs[N-1:1] = mask_higher_pri_regs[N-2:0] | req_masked[N-2:0];
assign mask_higher_pri_regs[0] = 1'b0;

assign gnt_masked[N-1:0] = req_masked[N-1:0] & ~mask_higher_pri_regs[N-1:0]; 

wire [N-1:0] unmask_higher_pri_regs;
wire [N-1:0] gnt_unmasked;

assign unmask_higher_pri_regs[N-1:1] = unmask_higher_pri_regs[N-2:0] | req[N-2:0];
assign unmask_higher_pri_regs[0] = 1'b0;

assign gnt_unmasked[N-1:0] = req[N-1:0] & ~unmask_higher_pri_regs[N-1:0];

wire no_req_masked;

assign no_req_masked = ~(|req_masked);
assign gnt = ({N{no_req_masked}} & gnt_unmasked) | gnt_masked; 

always @(negedge rst or posedge clock) 
    begin
        if (!rst) 
            begin
                pointer_reg <= {N{1'b1}};
            end 
        else 
            begin
                if (|req_masked)
                    pointer_reg <= mask_higher_pri_regs;
                else if (|req)
                    pointer_reg <= unmask_higher_pri_regs;
                else
                    pointer_reg <= pointer_reg;
            end
    end

endmodule