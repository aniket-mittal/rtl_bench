module origen_024813 (
    input wire clk,
    input wire reset,
    input wire dir,
    input wire SA_in,
    input wire SB_in,
    input wire SC_in,
    output reg fault
);

    reg [2:0] SA_out, SB_out, SC_out;
    reg [31:0] clk_counter;
    reg clk_reg;
    reg [2:0] fault_counter;
    reg [2:0] default_counter;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            SA_out <= 3'b0;
            SB_out <= 3'b0;
            SC_out <= 3'b0;
            fault <= 1'b1;
            clk_counter <= 32'b0;
            clk_reg <= 1'b0;
            fault_counter <= 3'b0;
            default_counter <= 3'b0;
        end else begin
            // Clock monitoring
            if (clk_reg != clk) begin
                clk_reg <= clk;
                clk_counter <= 32'b0;
            end else begin
                clk_counter <= clk_counter + 1;
                if (clk_counter > 32'd50_000_000) begin
                    fault <= 1'b1;
                end
            end

            // State transition monitoring
            case ({SA_out, SB_out, SC_out})
                3'b100: begin
                    if ({SA_in, SB_in, SC_in} == 3'b110 || {SA_in, SB_in, SC_in} == 3'b101) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                3'b110: begin
                    if ({SA_in, SB_in, SC_in} == 3'b010 || {SA_in, SB_in, SC_in} == 3'b100) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                3'b010: begin
                    if ({SA_in, SB_in, SC_in} == 3'b011 || {SA_in, SB_in, SC_in} == 3'b110) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                3'b011: begin
                    if ({SA_in, SB_in, SC_in} == 3'b001 || {SA_in, SB_in, SC_in} == 3'b010) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                3'b001: begin
                    if ({SA_in, SB_in, SC_in} == 3'b101 || {SA_in, SB_in, SC_in} == 3'b011) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                3'b101: begin
                    if ({SA_in, SB_in, SC_in} == 3'b100 || {SA_in, SB_in, SC_in} == 3'b001) begin
                        default_counter <= default_counter + 1;
                        fault_counter <= 3'b0;
                    end else begin
                        fault_counter <= fault_counter + 1;
                        default_counter <= 3'b0;
                    end
                end
                default: begin
                    fault_counter <= fault_counter + 1;
                    default_counter <= 3'b0;
                end
            endcase

            // Fault detection
            if (fault_counter == 3'd3) begin
                fault <= 1'b0;
            end else if (default_counter == 3'd7) begin
                fault <= 1'b1;
                fault_counter <= 3'b0;
                default_counter <= 3'b0;
            end

            // Update state
            SA_out <= SA_in;
            SB_out <= SB_in;
            SC_out <= SC_in;
        end
    end

endmodule