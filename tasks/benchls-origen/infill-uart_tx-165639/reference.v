module origen_165639 #(
    parameter div = 16'd868  // Clock division factor (for 115200 baud rate)
)(
    input clk,
    input rst,
    input wr,
    input [7:0] din,
    output reg txd,
    output reg rdy
);

    reg [31:0] count;
    reg [7:0] data;
    reg [3:0] state, n_state;

    localparam s0 = 4'd0, s1 = 4'd1, s2 = 4'd2, s3 = 4'd3, s4 = 4'd4,
              s5 = 4'd5, s6 = 4'd6, s7 = 4'd7, s8 = 4'd8, s9 = 4'd9;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            state <= s0;
            txd <= 1'b1;
            rdy <= 1'b1;
        end
        else begin
            state <= n_state;
            if (count == div - 1) begin
                count <= 0;
            end
            else begin
                count <= count + 1;
            end
        end
    end

    always @(*) begin
        case (state)
            s0: begin
                if (wr) begin
                    n_state = s1;
                    data = din;
                    rdy = 1'b0;
                end
                else begin
                    n_state = s0;
                    rdy = 1'b1;
                end
                txd = 1'b1;
            end
            s1: begin
                n_state = s2;
                txd = 1'b0;
            end
            s2: begin
                n_state = s3;
                txd = data[0];
            end
            s3: begin
                n_state = s4;
                txd = data[1];
            end
            s4: begin
                n_state = s5;
                txd = data[2];
            end
            s5: begin
                n_state = s6;
                txd = data[3];
            end
            s6: begin
                n_state = s7;
                txd = data[4];
            end
            s7: begin
                n_state = s8;
                txd = data[5];
            end
            s8: begin
                n_state = s9;
                txd = data[6];
            end
            s9: begin
                n_state = s0;
                txd = data[7];
            end
            default: begin
                n_state = s0;
                txd = 1'b1;
                rdy = 1'b1;
            end
        endcase
    end

endmodule