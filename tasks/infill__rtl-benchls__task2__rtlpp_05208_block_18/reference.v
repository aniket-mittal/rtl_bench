module rtlpp_05208 (
    input clk,
    input reset_b,
    input [11:0] dac_par_in,
    output reg dac_cs,
    output dac_sclk,
    output dac_mosi
);

reg clk_1MHZdac;
reg [5:0] ctrdac;
parameter TC = 6'd63;
parameter control_vector = 4'b0000;

parameter IDLE = 4'd0000; 
parameter SHIFT_OUT = 4'd0001;
parameter SYNC_DATA = 4'd0002;

reg tick_dac;

always @(posedge clk) begin
    if (!reset_b) begin
        ctrdac <= 0;
        tick_dac <= 0;
        clk_1MHZdac <= 0;
    end else begin
        ctrdac <= ctrdac - 1'b1;
        tick_dac <= 0;
        if (ctrdac == 63) begin
            tick_dac <= 1'b1;
            clk_1MHZdac <= ~clk_1MHZdac;
        end else if (ctrdac == 31) begin
            clk_1MHZdac <= ~clk_1MHZdac;
        end
    end
end

assign dac_sclk = clk_1MHZdac;

reg parLoad_en;
reg shift_en;
reg [15:0] shift_reg_dac1;
reg [4:0] shift_ctr;

always @(posedge clk) begin
    if (tick_dac == 1) begin
        if (parLoad_en == 1) begin
            shift_ctr <= 4'b0000;
            shift_reg_dac1 <= {control_vector, dac_par_in};
        end else if (shift_en == 1) begin
            shift_reg_dac1 <= {shift_reg_dac1[14:0], shift_reg_dac1[15]};
            shift_ctr <= shift_ctr + 1;
        end
    end
end

assign dac_mosi = shift_reg_dac1[15];

reg [4:0] current_state;
reg [4:0] next_state;

always @(posedge clk) begin
    if (tick_dac == 1) begin
        if (!reset_b) 
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end
end

reg dac_done;
always @(posedge clk) begin
    case (current_state)
        IDLE: begin
            shift_en <= 0;
            dac_done <= 1;
            dac_cs <= 1;
            parLoad_en <= 1;
        end
        SHIFT_OUT: begin
            shift_en <= 1;
            dac_done <= 0;
            dac_cs <= 0;
            parLoad_en <= 0;
        end
        SYNC_DATA: begin
            shift_en <= 0;
            dac_done <= 0;
            dac_cs <= 1;
            parLoad_en <= 0;
        end
    endcase
end

always @(posedge clk) begin
    if (reset_b) begin
        case (current_state)
            IDLE: next_state <= SHIFT_OUT;
            SHIFT_OUT: if (shift_ctr == 4'hF) next_state <= SYNC_DATA;
            SYNC_DATA: next_state <= IDLE;
            default: next_state <= IDLE;
        endcase
    end
end

endmodule