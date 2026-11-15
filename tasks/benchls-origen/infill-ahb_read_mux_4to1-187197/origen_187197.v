module origen_187197
#(parameter dataWidth = 32)
(
    input  [dataWidth-1:0] HRDATA1,
    input  [dataWidth-1:0] HRDATA2,
    input  [dataWidth-1:0] HRDATA3,
    input  [dataWidth-1:0] HRDATA4,
    input                 HRESP1,
    input                 HRESP2,
    input                 HRESP3,
    input                 HRESP4,
    input                 HREADY1,
    input                 HREADY2,
    input                 HREADY3,
    input                 HREADY4,
    input         [1:0]    addr,
    output reg [dataWidth-1:0] HRDATA,
    output reg             HRESP,
    output reg             HREADY
);

[MASKED]

endmodule