module origen_176482 #
(
    parameter integer C_M_AXIS_TDATA_WIDTH = 32
)
(
    // Inputs
    input wire                       pi_r_data,
    input wire                       pi_tlast,
    input wire                       pi_data_avaliable,
    input wire                       M_AXIS_ACLK,
    input wire                       M_AXIS_ARESETN,
    input wire                       M_AXIS_TREADY,

    // Outputs
    output reg                       po_read_data,
    output reg                       M_AXIS_TVALID,
    output reg [C_M_AXIS_TDATA_WIDTH-1:0] M_AXIS_TDATA,
    output reg [(C_M_AXIS_TDATA_WIDTH/8)-1:0] M_AXIS_TSTRB,
    output reg                       M_AXIS_TLAST
);

    // Internal signals
    reg [1:0]                         mst_exec_state;
    reg                               reg_empty;
    reg                               axis_tvalid;
    reg [C_M_AXIS_TDATA_WIDTH-1:0]    stream_data_out;
    reg                               tx_en;
    reg                               tx_done;
    reg [31:0]                        counter;
    reg                               tlast;

    // AXI4-Stream Master State Machine
    localparam IDLE = 2'b00;
    localparam INIT_TRANSFER = 2'b01;
    localparam TRANSFER_ACTIVE = 2'b10;
    localparam TRANSFER_COMP = 2'b11;

    [MASKED]

endmodule