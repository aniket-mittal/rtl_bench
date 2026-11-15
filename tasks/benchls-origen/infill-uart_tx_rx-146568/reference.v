module origen_146568 (
    input wire i_Clk,
    input wire i_RX_Serial,
    input wire [7:0] i_TX_Byte,
    input wire i_TX_Load,
    output reg [7:0] o_RX_Byte,
    output reg o_RX_Done,
    output wire o_TX_Active,
    output reg o_TX_Done,
    output wire o_TX_Serial
);

// Parameters
parameter CLKS_PER_BIT = 5208; // 50MHz / 9600 baud
parameter IDLE = 3'b000;
parameter START_BIT = 3'b001;
parameter DATA_BITS = 3'b010;
parameter STOP_BIT = 3'b011;
parameter CLEANUP = 3'b100;

// Internal signals
reg [2:0] r_RX_State = IDLE;
reg [2:0] r_TX_State = IDLE;
reg [12:0] r_RX_Clock_Count = 0;
reg [12:0] r_TX_Clock_Count = 0;
reg [2:0] r_RX_Bit_Index = 0;
reg [2:0] r_TX_Bit_Index = 0;
reg [7:0] r_RX_Byte = 0;
reg r_TX_Serial = 1'b1;
reg r_TX_Active = 1'b0;

// RX Logic
always @(posedge i_Clk) begin
    case (r_RX_State)
        IDLE: begin
            o_RX_Done <= 1'b0;
            r_RX_Clock_Count <= 0;
            r_RX_Bit_Index <= 0;
            if (i_RX_Serial == 1'b0)
                r_RX_State <= START_BIT;
            else
                r_RX_State <= IDLE;
        end
        
        START_BIT: begin
            if (r_RX_Clock_Count == (CLKS_PER_BIT-1)/2) begin
                if (i_RX_Serial == 1'b0) begin
                    r_RX_Clock_Count <= 0;
                    r_RX_State <= DATA_BITS;
                end else
                    r_RX_State <= IDLE;
            end else begin
                r_RX_Clock_Count <= r_RX_Clock_Count + 1;
                r_RX_State <= START_BIT;
            end
        end
        
        DATA_BITS: begin
            if (r_RX_Clock_Count < CLKS_PER_BIT-1) begin
                r_RX_Clock_Count <= r_RX_Clock_Count + 1;
                r_RX_State <= DATA_BITS;
            end else begin
                r_RX_Clock_Count <= 0;
                r_RX_Byte[r_RX_Bit_Index] <= i_RX_Serial;
                if (r_RX_Bit_Index < 7) begin
                    r_RX_Bit_Index <= r_RX_Bit_Index + 1;
                    r_RX_State <= DATA_BITS;
                end else begin
                    r_RX_Bit_Index <= 0;
                    r_RX_State <= STOP_BIT;
                end
            end
        end
        
        STOP_BIT: begin
            if (r_RX_Clock_Count < CLKS_PER_BIT-1) begin
                r_RX_Clock_Count <= r_RX_Clock_Count + 1;
                r_RX_State <= STOP_BIT;
            end else begin
                o_RX_Done <= 1'b1;
                o_RX_Byte <= r_RX_Byte;
                r_RX_Clock_Count <= 0;
                r_RX_State <= CLEANUP;
            end
        end
        
        CLEANUP: begin
            r_RX_State <= IDLE;
            o_RX_Done <= 1'b0;
        end
        
        default: r_RX_State <= IDLE;
    endcase
end

// TX Logic
always @(posedge i_Clk) begin
    case (r_TX_State)
        IDLE: begin
            o_TX_Done <= 1'b0;
            r_TX_Serial <= 1'b1;
            r_TX_Clock_Count <= 0;
            r_TX_Bit_Index <= 0;
            if (i_TX_Load) begin
                r_TX_Active <= 1'b1;
                r_TX_State <= START_BIT;
            end else
                r_TX_State <= IDLE;
        end
        
        START_BIT: begin
            r_TX_Serial <= 1'b0;
            if (r_TX_Clock_Count < CLKS_PER_BIT-1) begin
                r_TX_Clock_Count <= r_TX_Clock_Count + 1;
                r_TX_State <= START_BIT;
            end else begin
                r_TX_Clock_Count <= 0;
                r_TX_State <= DATA_BITS;
            end
        end
        
        DATA_BITS: begin
            r_TX_Serial <= i_TX_Byte[r_TX_Bit_Index];
            if (r_TX_Clock_Count < CLKS_PER_BIT-1) begin
                r_TX_Clock_Count <= r_TX_Clock_Count + 1;
                r_TX_State <= DATA_BITS;
            end else begin
                r_TX_Clock_Count <= 0;
                if (r_TX_Bit_Index < 7) begin
                    r_TX_Bit_Index <= r_TX_Bit_Index + 1;
                    r_TX_State <= DATA_BITS;
                end else begin
                    r_TX_Bit_Index <= 0;
                    r_TX_State <= STOP_BIT;
                end
            end
        end
        
        STOP_BIT: begin
            r_TX_Serial <= 1'b1;
            if (r_TX_Clock_Count < CLKS_PER_BIT-1) begin
                r_TX_Clock_Count <= r_TX_Clock_Count + 1;
                r_TX_State <= STOP_BIT;
            end else begin
                o_TX_Done <= 1'b1;
                r_TX_Clock_Count <= 0;
                r_TX_State <= CLEANUP;
                r_TX_Active <= 1'b0;
            end
        end
        
        CLEANUP: begin
            o_TX_Done <= 1'b0;
            r_TX_State <= IDLE;
        end
        
        default: r_TX_State <= IDLE;
    endcase
end

assign o_TX_Active = r_TX_Active;
assign o_TX_Serial = r_TX_Serial;

endmodule