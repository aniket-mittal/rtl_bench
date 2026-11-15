module origen_020339 (
    input wire clk,
    input wire reset,
    input wire [2:0] rot,
    output reg rot_btn,
    output reg rot_event,
    output reg rot_left
);

    reg [1:0] rot_q;
    reg [1:0] rot_q_prev;
    reg [15:0] dead_count;
    reg [2:0] rot_d;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rot_q <= 2'b00;
            rot_q_prev <= 2'b00;
            rot_event <= 1'b0;
            rot_left <= 1'b0;
            rot_btn <= 1'b0;
            dead_count <= 16'd0;
            rot_d <= 3'b000;
        end else begin
            // Rotation detection
            rot_q <= rot[1:0];
            rot_q_prev <= rot_q;

            // Rotation event and direction
            rot_event <= 1'b0;
            if (rot_q != rot_q_prev) begin
                rot_event <= 1'b1;
                case ({rot_q_prev, rot_q})
                    4'b0001, 4'b0111, 4'b1110, 4'b1000: rot_left <= 1'b0;
                    4'b0010, 4'b1011, 4'b1101, 4'b0100: rot_left <= 1'b1;
                    default: rot_event <= 1'b0;
                endcase
            end

            // Button debouncing
            rot_d <= {rot_d[1:0], rot[2]};
            rot_btn <= 1'b0;

            if (rot_d[2] && !rot_d[1] && dead_count == 16'd0) begin
                rot_btn <= 1'b1;
                dead_count <= 16'd50000; // Adjust for desired debounce time
            end else if (dead_count > 16'd0) begin
                dead_count <= dead_count - 1'b1;
            end
        end
    end

endmodule