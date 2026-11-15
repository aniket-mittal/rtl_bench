module origen_112117 (
    input wire clk,
    input wire start,
    input wire reset,
    output reg clear_acc,
    output reg done,
    output reg wr_en_x,
    output reg wr_en_y,
    output reg wr_en_a,
    output reg [3:0] addr_x,
    output reg [1:0] addr_y,
    output reg [1:0] addr_a
);

    reg [15:0] state;
    reg [15:0] next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 16'd0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        clear_acc = 1'b0;
        done = 1'b0;
        wr_en_x = 1'b0;
        wr_en_y = 1'b0;
        wr_en_a = 1'b0;
        addr_x = 4'd0;
        addr_y = 2'd0;
        addr_a = 2'd0;

        case (state)
            16'd0: begin
                if (start)
                    next_state = state + 1'b1;
                wr_en_x = 1'b1;
                addr_x = 4'd0;
            end
            16'd1, 16'd2, 16'd3, 16'd4, 16'd5, 16'd6, 16'd7, 16'd8: begin
                next_state = state + 1'b1;
                wr_en_x = 1'b1;
                addr_x = state[3:0];
            end
            16'd9: begin
                next_state = state + 1'b1;
                wr_en_x = 1'b1;
                wr_en_a = 1'b1;
                addr_x = 4'd9;
                addr_a = 2'd0;
            end
            16'd10, 16'd11: begin
                next_state = state + 1'b1;
                wr_en_a = 1'b1;
                addr_a = state[1:0] - 2'd1;
            end
            16'd12: begin
                next_state = state + 1'b1;
                wr_en_a = 1'b1;
                addr_a = 2'd3;
                clear_acc = 1'b1;
            end
            16'd13, 16'd14, 16'd15, 16'd16, 16'd17, 16'd18, 16'd19: begin
                next_state = state + 1'b1;
                addr_x = state[3:0] - 4'd13;
                addr_a = {1'b0, state[0]};
            end
            16'd20: begin
                next_state = state + 1'b1;
                wr_en_y = 1'b1;
                addr_y = 2'd0;
                clear_acc = 1'b1;
            end
            16'd21, 16'd22, 16'd23, 16'd24, 16'd25, 16'd26, 16'd27: begin
                next_state = state + 1'b1;
                addr_x = state[3:0] - 4'd21;
                addr_a = {1'b0, state[0]};
            end
            16'd28: begin
                next_state = state + 1'b1;
                wr_en_y = 1'b1;
                addr_y = 2'd1;
                clear_acc = 1'b1;
            end
            16'd29, 16'd30, 16'd31, 16'd32, 16'd33, 16'd34, 16'd35: begin
                next_state = state + 1'b1;
                addr_x = state[3:0] - 4'd29;
                addr_a = {1'b0, state[0]};
            end
            16'd36: begin
                next_state = state + 1'b1;
                wr_en_y = 1'b1;
                addr_y = 2'd2;
            end
            16'd37: begin
                next_state = state + 1'b1;
                done = 1'b1;
            end
            16'd38: begin
                next_state = state + 1'b1;
                done = 1'b1;
            end
            16'd39: begin
                next_state = 16'd0;
            end
            default: next_state = 16'd0;
        endcase
    end

endmodule