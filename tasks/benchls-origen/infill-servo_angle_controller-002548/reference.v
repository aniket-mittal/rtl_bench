module origen_002548 (
    input wire CLK,
    input wire enable,
    input wire done_period,
    input wire [1:0] pullup_procedure,
    output reg [20:0] to_pwm,
    output reg done_up,
    output reg done_down
);

    parameter interval_change = 1;
    parameter max = 180;
    parameter min = 80;

    reg [7:0] angle_count;

    always @(posedge CLK) begin
        if (!enable) begin
            angle_count <= max;
            done_up <= 0;
            done_down <= 0;
        end else if (done_period) begin
            case (pullup_procedure)
                2'b01: begin
                    if (angle_count > min) begin
                        angle_count <= angle_count - interval_change;
                        done_up <= 0;
                    end else begin
                        done_up <= 1;
                    end
                    done_down <= 0;
                end
                2'b10: begin
                    if (angle_count < max) begin
                        angle_count <= angle_count + interval_change;
                        done_down <= 0;
                    end else begin
                        done_down <= 1;
                    end
                    done_up <= 0;
                end
                default: begin
                    // Do nothing
                end
            endcase
        end
    end

    always @(*) begin
        to_pwm = (angle_count * 2000 / 180) + 1000;
    end

endmodule