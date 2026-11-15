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

    always @(posedge M_AXIS_ACLK) begin
        if (~M_AXIS_ARESETN) begin
            mst_exec_state <= IDLE;
            reg_empty <= 1'b1;
            axis_tvalid <= 1'b0;
            M_AXIS_TVALID <= 1'b0;
            M_AXIS_TDATA <= {C_M_AXIS_TDATA_WIDTH{1'b0}};
            M_AXIS_TSTRB <= {(C_M_AXIS_TDATA_WIDTH/8){1'b0}};
            M_AXIS_TLAST <= 1'b0;
            po_read_data <= 1'b0;
            tx_en <= 1'b0;
            tx_done <= 1'b0;
            counter <= 32'b0;
            tlast <= 1'b0;
        end else begin
            case (mst_exec_state)
                IDLE: begin
                    if (pi_data_avaliable && reg_empty) begin
                        // Load data into internal register
                        stream_data_out <= {C_M_AXIS_TDATA_WIDTH{pi_r_data}};
                        tlast <= pi_tlast;
                        reg_empty <= 1'b0;
                        mst_exec_state <= INIT_TRANSFER;
                    end else begin
                        axis_tvalid <= 1'b0;
                        M_AXIS_TVALID <= 1'b0;
                        po_read_data <= 1'b0;
                        tx_en <= 1'b0;
                        tx_done <= 1'b0;
                        counter <= 32'b0;
                    end
                end
                INIT_TRANSFER: begin
                    axis_tvalid <= 1'b1;
                    tx_en <= 1'b1;
                    mst_exec_state <= TRANSFER_ACTIVE;
                end
                TRANSFER_ACTIVE: begin
                    if (M_AXIS_TREADY) begin
                        M_AXIS_TDATA <= stream_data_out;
                        M_AXIS_TSTRB <= {(C_M_AXIS_TDATA_WIDTH/8){1'b1}};
                        M_AXIS_TLAST <= tlast;
                        M_AXIS_TVALID <= axis_tvalid;
                        reg_empty <= 1'b1;
                        po_read_data <= 1'b1;
                        counter <= counter + 1;
                        if (tlast) begin
                            tx_done <= 1'b1;
                            mst_exec_state <= TRANSFER_COMP;
                        end
                    end else begin
                        M_AXIS_TVALID <= 1'b0;
                        po_read_data <= 1'b0;
                    end
                end
                TRANSFER_COMP: begin
                    axis_tvalid <= 1'b0;
                    tx_en <= 1'b0;
                    tx_done <= 1'b0;
                    mst_exec_state <= IDLE;
                end
                default: mst_exec_state <= IDLE;
            endcase
        end
    end

endmodule