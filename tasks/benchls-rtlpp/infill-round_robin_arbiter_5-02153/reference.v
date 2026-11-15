module rtlpp_02153(
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

reg [N-1:0] pointer_reg;
wire [N-1:0] req;

assign req = {req4,req3, req2, req1, req0};

wire [N-1:0] gnt;

assign gnt4 = gnt[4];
assign gnt3 = gnt[3];
assign gnt2 = gnt[2];
assign gnt1 = gnt[1];
assign gnt0 = gnt[0];

wire [N-1:0] req_masked;
reg [N-1:0] mask_higher_pri_regs;
wire [N-1:0] gnt_masked;
reg [N-1:0] unmask_higher_pri_regs;
wire [N-1:0] gnt_unmasked;
wire no_req_masked;

assign req_masked = req & pointer_reg;
assign gnt_masked = req_masked & ~mask_higher_pri_regs;
assign gnt_unmasked = req & ~unmask_higher_pri_regs;

assign no_req_masked = ~(|req_masked);
assign gnt = ({N{no_req_masked}} & gnt_unmasked) | gnt_masked;

always @(*) begin
    mask_higher_pri_regs[N-1:1] = mask_higher_pri_regs[N-2:0] | req_masked[N-2:0];
    mask_higher_pri_regs[0] = 1'b0;
end

always @(*) begin
    unmask_higher_pri_regs[N-1:1] = unmask_higher_pri_regs[N-2:0] | req[N-2:0];
    unmask_higher_pri_regs[0] = 1'b0;
end

always @(negedge rst or posedge clock) begin
    if(!rst) begin
        pointer_reg <= {N{1'b1}};
    end else begin
        if(|req_masked) begin
            pointer_reg <= mask_higher_pri_regs;
        end else if(|req) begin
            pointer_reg <= unmask_higher_pri_regs;
        end else begin
            pointer_reg <= pointer_reg;
        end
    end
end

endmodule