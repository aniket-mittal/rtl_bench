module origen_168128(
    input rst,
    input clk,
    input fast_clk,
    output reg Ra, Ya, Ga,
    output reg Rb, Yb, Gb,
    output reg Rw, Gw
);

    reg [3:0] counter;
    reg [2:0] state;
    reg flag;

    initial begin
        counter = 4'b0011;
        state = 3'b000;
        flag = 0;
        Rw = 1;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter = 4'b0011;
            state = 3'b000;
            flag = 0;
            Rw = 1;
        end
        else begin
            if (counter == 0) begin
                case (state)
                    3'b000: begin
                        state = 3'b001;
                        counter = 4'b1000;
                    end
                    3'b001: begin
                        state = 3'b010;
                        counter = 4'b1000;
                    end
                    3'b010: begin
                        state = 3'b011;
                        counter = 4'b1000;
                    end
                    3'b011: begin
                        state = 3'b100;
                        counter = 4'b1000;
                    end
                    3'b100: begin
                        state = 3'b101;
                        counter = 4'b0100;
                        flag = 1;
                    end
                    3'b101: begin
                        state = 3'b000;
                        counter = 4'b0011;
                        flag = 0;
                    end
                endcase
            end
            else begin
                counter = counter - 1;
            end
        end
    end

    always @(*) begin
        case (state)
            3'b000: begin
                Ra = 0; Ya = 0; Ga = 1;
                Rb = 1; Yb = 0; Gb = 0;
                Rw = 1; Gw = 0;
            end
            3'b001: begin
                Ra = 0; Ya = 1; Ga = 0;
                Rb = 1; Yb = 0; Gb = 0;
                Rw = 1; Gw = 0;
            end
            3'b010: begin
                Ra = 1; Ya = 0; Ga = 0;
                Rb = 0; Yb = 0; Gb = 1;
                Rw = 1; Gw = 0;
            end
            3'b011: begin
                Ra = 1; Ya = 1; Ga = 0;
                Rb = 0; Yb = 1; Gb = 0;
                Rw = 1; Gw = 0;
            end
            3'b100: begin
                Ra = 1; Ya = 0; Ga = 0;
                Rb = 1; Yb = 0; Gb = 0;
                Rw = 1; Gw = 1;
            end
            3'b101: begin
                Ra = 1; Ya = 0; Ga = 0;
                Rb = 1; Yb = 0; Gb = 0;
                Rw = ~Rw;
            end
        endcase
    end

    always @(posedge fast_clk) begin
        if (flag) begin
            Rw = ~Rw;
        end
    end

endmodule