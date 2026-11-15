module rtlpp_00010(
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

// Parameter declaration
parameter N = 5;

// Input and output port declaration
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

// Internal variable declaration
reg  [N-1:0] pointer_reg;
wire [N-1:0] req;
wire [N-1:0] gnt;
wire [N-1:0] req_masked;
wire [N-1:0] mask_higher_pri_regs;
wire [N-1:0] gnt_masked;
wire [N-1:0] unmask_higher_pri_regs;
wire [N-1:0] gnt_unmasked;
wire no_req_masked;

// Assign requests to a wire array
assign req = {req4, req3, req2, req1, req0};

// Assign grants to the output ports
assign gnt4 = gnt[4];
assign gnt3 = gnt[3];
assign gnt2 = gnt[2];
assign gnt1 = gnt[1];
assign gnt0 = gnt[0];

// Masking requests with the pointer register
assign req_masked = req & pointer_reg;

// Generate masked grants by setting higher priority requests
assign mask_higher_pri_regs[N-1:1] = mask_higher_pri_regs[N-2:0] | req_masked[N-2:0];
assign mask_higher_pri_regs[0] = 1'b0;
assign gnt_masked = req_masked & ~mask_higher_pri_regs;

// Generate unmasked grants by considering all requests
assign unmask_higher_pri_regs[N-1:1] = unmask_higher_pri_regs[N-2:0] | req[N-2:0];
assign unmask_higher_pri_regs[0] = 1'b0;
assign gnt_unmasked = req & ~unmask_higher_pri_regs;

// Determine if there are no masked requests
assign no_req_masked = ~(|req_masked);

// Combining masked and unmasked grants based on no request masked condition
assign gnt = ({N{no_req_masked}} & gnt_unmasked) | gnt_masked;

// Sequential logic to update the pointer register
always @(negedge rst or posedge clock) begin
    if (!rst) begin
        pointer_reg <= {N{1'b1}};
    end else begin
        if (|req_masked) 
            pointer_reg <= mask_higher_pri_regs;
        else if (|req) 
            pointer_reg <= unmask_higher_pri_regs;
        else 
            pointer_reg <= pointer_reg;
    end
end

endmodule