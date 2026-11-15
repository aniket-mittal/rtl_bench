module origen_105152 #(
    parameter INPUT_CLK = 100_000_000,
    parameter BAUD_RATE = 9600
) (
    input wire send,
    input wire [7:0] data,
    input wire clk,
    output reg rdy,
    output wire tx
);

localparam CLKS_PER_BIT = INPUT_CLK / BAUD_RATE;

reg [9:0] txData;
reg [1:0] txState;
reg [31:0] bitTmr;
reg bitDone;
reg txBit;
reg [3:0] bitIdx;

localparam RDY = 2'b00;
localparam LD = 2'b01;
localparam BITSEND = 2'b10;

assign tx = txBit;

always @(posedge clk) begin
    bit_counting;
    tx_proc;
    tx_bit;
    bit_timing;
    sm;
end

task bit_counting;
    if (txState == BITSEND) begin
        if (bitDone) begin
            if (bitIdx == 4'd9)
                bitIdx <= 4'd0;
            else
                bitIdx <= bitIdx + 1'b1;
        end
    end else begin
        bitIdx <= 4'd0;
    end
endtask

task tx_proc;
    if (txState == RDY && send)
        txData <= {1'b1, data, 1'b0};
endtask

task tx_bit;
    case (txState)
        RDY: txBit <= 1'b1;
        LD: txBit <= txData[bitIdx];
        BITSEND: txBit <= txData[bitIdx];
        default: txBit <= 1'b1;
    endcase
endtask

task bit_timing;
    case (txState)
        RDY: begin
            bitDone <= 1'b0;
            bitTmr <= 32'd0;
        end
        LD: begin
            bitDone <= 1'b0;
            bitTmr <= 32'd0;
        end
        BITSEND: begin
            if (bitTmr == CLKS_PER_BIT - 1) begin
                bitDone <= 1'b1;
                bitTmr <= 32'd0;
            end else begin
                bitDone <= 1'b0;
                bitTmr <= bitTmr + 1'b1;
            end
        end
    endcase
endtask

task sm;
    case (txState)
        RDY: begin
            rdy <= 1'b1;
            if (send)
                txState <= LD;
        end
        LD: begin
            rdy <= 1'b0;
            txState <= BITSEND;
        end
        BITSEND: begin
            rdy <= 1'b0;
            if (bitDone) begin
                if (bitIdx == 4'd9)
                    txState <= RDY;
                else
                    txState <= LD;
            end
        end
        default: txState <= RDY;
    endcase
endtask

endmodule