module origen_159690 #(
    parameter g_System_Clk = 50000000,
    parameter g_Baud_Rate = 115200
)
(
    input  wire        i_Clk,
    input  wire        i_RX,
    output reg         o_RX_DV,
    output reg  [7:0]  o_RX_Byte
);

    localparam c_Sampling_Limit = g_System_Clk / g_Baud_Rate;

    reg [2:0] r_State_C;
    reg [2:0] r_State_N;
    reg [15:0] r_Sampling_Counter;
    reg [3:0] r_Byte_Index;
    reg [7:0] r_RX_Byte;

    always @(posedge i_Clk) begin
        r_State_C <= r_State_N;
    end

    always @(*) begin
        case (r_State_C)
            3'b000: begin // s_Idle
                if (~i_RX) begin
                    r_State_N = 3'b001; // s_Start
                end else begin
                    r_State_N = 3'b000; // s_Idle
                end
            end
            3'b001: begin // s_Start
                if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                    r_State_N = 3'b010; // s_Read_Data
                    r_Sampling_Counter = 0;
                    r_Byte_Index = 0;
                end else begin
                    r_State_N = 3'b001; // s_Start
                    r_Sampling_Counter = r_Sampling_Counter + 1;
                end
            end
            3'b010: begin // s_Read_Data
                if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                    r_RX_Byte[r_Byte_Index] = i_RX;
                    r_Byte_Index = r_Byte_Index + 1;
                    r_Sampling_Counter = 0;
                    if (r_Byte_Index == 4'd8) begin
                        r_State_N = 3'b011; // s_Stop
                    end else begin
                        r_State_N = 3'b010; // s_Read_Data
                    end
                end else begin
                    r_State_N = 3'b010; // s_Read_Data
                    r_Sampling_Counter = r_Sampling_Counter + 1;
                end
            end
            3'b011: begin // s_Stop
                if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                    if (i_RX) begin
                        o_RX_Byte <= r_RX_Byte;
                        o_RX_DV <= 1'b1;
                    end else begin
                        o_RX_DV <= 1'b0;
                    end
                    r_State_N = 3'b000; // s_Idle
                end else begin
                    r_State_N = 3'b011; // s_Stop
                    r_Sampling_Counter = r_Sampling_Counter + 1;
                end
            end
            default: begin
                r_State_N = 3'b000; // s_Idle
            end
        endcase
    end

    always @(posedge i_Clk) begin
        if (r_State_C == 3'b000) begin // s_Idle
            o_RX_DV <= 1'b0;
            r_Sampling_Counter <= 0;
        end else if (r_State_C == 3'b001) begin // s_Start
            if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                r_Sampling_Counter <= 0;
            end else begin
                r_Sampling_Counter <= r_Sampling_Counter + 1;
            end
        end else if (r_State_C == 3'b010) begin // s_Read_Data
            if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                r_Sampling_Counter <= 0;
            end else begin
                r_Sampling_Counter <= r_Sampling_Counter + 1;
            end
        end else if (r_State_C == 3'b011) begin // s_Stop
            if (r_Sampling_Counter == c_Sampling_Limit - 1) begin
                r_Sampling_Counter <= 0;
            end else begin
                r_Sampling_Counter <= r_Sampling_Counter + 1;
            end
        end
    end

endmodule