module origen_027023(
    input clk,
    input [1:0] sw,
    input butt1, butt2, butt3, butt4,
    output reg [3:0] led,
    output reg [8:0] R_time_out, G_time_out, B_time_out
);

    reg [8:0] R_temp, G_temp, B_temp;

    always @(posedge clk) begin
        case(sw)
            2'b00: begin // Reset and Output mode
                if (butt1) begin
                    R_temp <= 9'd0;
                    G_temp <= 9'd0;
                    B_temp <= 9'd0;
                end else if (butt2) begin
                    R_time_out <= R_temp;
                    G_time_out <= G_temp;
                    B_time_out <= B_temp;
                end else begin
                    R_time_out <= 9'd0;
                    G_time_out <= 9'd0;
                    B_time_out <= 9'd0;
                end
                led <= 4'd0;
            end
            2'b01: begin // Red adjustment mode
                if (butt3 && R_temp < 9'd300)
                    R_temp <= R_temp + 9'd20;
                else if (butt4 && R_temp > 9'd0)
                    R_temp <= R_temp - 9'd20;
                led <= R_temp / 9'd20;
            end
            2'b10: begin // Green adjustment mode
                if (butt3 && G_temp < 9'd300)
                    G_temp <= G_temp + 9'd20;
                else if (butt4 && G_temp > 9'd0)
                    G_temp <= G_temp - 9'd20;
                led <= G_temp / 9'd20;
            end
            2'b11: begin // Blue adjustment mode
                if (butt3 && B_temp < 9'd300)
                    B_temp <= B_temp + 9'd20;
                else if (butt4 && B_temp > 9'd0)
                    B_temp <= B_temp - 9'd20;
                led <= B_temp / 9'd20;
            end
        endcase
    end

endmodule