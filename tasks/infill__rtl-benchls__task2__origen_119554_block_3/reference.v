module origen_119554 #(
    parameter int unsigned Depth = 4,
    parameter int unsigned Width = 32
) (
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             clr_i,
    input  logic             wvalid_i,
    output logic             wready_o,
    input  logic [Width-1:0] wdata_i,
    output logic             rvalid_o,
    input  logic             rready_i,
    output logic [Width-1:0] rdata_o,
    output logic [$clog2(Depth+1)-1:0] depth_o
);

    localparam int unsigned PTRV_W = $clog2(Depth);

    generate
        if (Depth == 0) begin : gen_passthru
            assign wready_o = rready_i;
            assign rvalid_o = wvalid_i;
            assign rdata_o  = wdata_i;
            assign depth_o  = 1'b0;
        end else begin : gen_fifo
            logic [PTRV_W-1:0] wptr_q, rptr_q;
            logic [Width-1:0] storage [Depth];
            logic full, empty;

            always_ff @(posedge clk_i or negedge rst_ni) begin
                if (!rst_ni) begin
                    wptr_q <= '0;
                    rptr_q <= '0;
                end else if (clr_i) begin
                    wptr_q <= '0;
                    rptr_q <= '0;
                end else begin
                    if (wvalid_i && !full) wptr_q <= wptr_q + 1'b1;
                    if (rready_i && !empty) rptr_q <= rptr_q + 1'b1;
                end
            end

            always_ff @(posedge clk_i) begin
                if (wvalid_i && !full) storage[wptr_q] <= wdata_i;
            end

            assign full  = (wptr_q == rptr_q - 1'b1) || (Depth == 1 && wptr_q != rptr_q);
            assign empty = (wptr_q == rptr_q);
            assign wready_o = !full;
            assign rvalid_o = !empty;
            assign rdata_o  = storage[rptr_q];
            assign depth_o  = wptr_q - rptr_q;
        end
    endgenerate

endmodule

module fifo_sync #(
    parameter int unsigned ReqDepth = 4,
    parameter int unsigned Width = 32
) (
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic             clr_i,
    input  logic             wvalid_i,
    output logic             wready_o,
    input  logic [Width-1:0] wdata_i,
    output logic             rvalid_o,
    input  logic             rready_i,
    output logic [Width-1:0] rdata_o,
    output logic [$clog2(ReqDepth+1)-1:0] depth_o
);

    prim_fifo_sync #(
        .Depth(ReqDepth),
        .Width(Width)
    ) u_fifo (
        .*
    );

endmodule

module socket_1n #(
    parameter int unsigned N = 4,
    parameter bit [31:0] DReqDepth = 32'h11223344
) (
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic [N-1:0]     clr_i,
    input  logic [N-1:0]     wvalid_i,
    output logic [N-1:0]     wready_o,
    input  logic [32*N-1:0]  wdata_i,
    output logic [N-1:0]     rvalid_o,
    input  logic [N-1:0]     rready_i,
    output logic [32*N-1:0]  rdata_o,
    output logic [4*N-1:0]   depth_o
);

    localparam int unsigned AA = DReqDepth[31:16];
    localparam int unsigned BB = DReqDepth[15:0];

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_fifos
            localparam int unsigned ReqDepth = DReqDepth[i*4+3:i*4];
            fifo_sync #(
                .ReqDepth(ReqDepth),
                .Width(32)
            ) u_fifo (
                .clk_i    (clk_i),
                .rst_ni   (rst_ni),
                .clr_i    (clr_i[i]),
                .wvalid_i (wvalid_i[i]),
                .wready_o (wready_o[i]),
                .wdata_i  (wdata_i[32*i+:32]),
                .rvalid_o (rvalid_o[i]),
                .rready_i (rready_i[i]),
                .rdata_o  (rdata_o[32*i+:32]),
                .depth_o  (depth_o[4*i+:4])
            );
        end
    endgenerate

endmodule

module all_zero #(
    parameter int unsigned N = 4
) (
    input  logic             clk_i,
    input  logic             rst_ni,
    input  logic [N-1:0]     clr_i,
    input  logic [N-1:0]     wvalid_i,
    output logic [N-1:0]     wready_o,
    input  logic [32*N-1:0]  wdata_i,
    output logic [N-1:0]     rvalid_o,
    input  logic [N-1:0]     rready_i,
    output logic [32*N-1:0]  rdata_o,
    output logic [4*N-1:0]   depth_o
);

    socket_1n #(
        .N(N),
        .DReqDepth(32'h0)
    ) u_socket_1n (
        .*
    );

endmodule