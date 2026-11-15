module origen_220862 #(
    parameter L = 9
)(
    input  wire        clk,
    input  wire        rst,
    input  wire        ld,
    input  wire        acc,
    input  wire        ce,
    input  wire [15:0] phase_in,
    output reg  [15:0] phase_out,
    output reg         phase_out_rdy
);

    parameter Pi = 16'h648B;

    reg [15:0] phase_in_lat;
    reg [15:0] phase_rot;
    reg [15:0] phase_rot_acc;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase_in_lat <= 0;
            phase_rot <= 0;
            phase_rot_acc <= 0;
            phase_out <= 0;
            phase_out_rdy <= 0;
        end
        else begin
            if (ld) begin
                phase_in_lat <= phase_in;
                phase_rot <= phase_in >> L;
                phase_out_rdy <= 1;
            end
            if (acc && ce) begin
                phase_rot_acc <= phase_rot + phase_in_lat;
                if (phase_rot_acc > Pi) begin
                    phase_rot <= (phase_rot_acc - Pi) << 1;
                end
                else if (phase_rot_acc < -Pi) begin
                    phase_rot <= (phase_rot_acc + Pi) << 1;
                end
                else begin
                    phase_rot <= phase_rot_acc;
                end
                phase_out <= phase_rot;
            end
            else begin
                phase_out_rdy <= 0;
            end
        end
    end

endmodule