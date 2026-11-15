module origen_106471(
    input wire clock,
    input wire reset,
    input wire crash,
    input wire press,
    output reg [7:0][7:0] green
);

    reg [2:0] count;
    reg [7:0] counter;
    reg on;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            count <= 3'b100;
            counter <= 8'b0;
            on <= 1'b0;
        end else if (crash) begin
            count <= 3'bx;
        end else begin
            if (counter == 8'b10000000) begin
                counter <= 8'b0;
                on <= 1'b1;
            end else begin
                counter <= counter + 1'b1;
                on <= 1'b0;
            end

            if (press)
                count <= count + 1'b1;
            else if (on)
                count <= count - 1'b1;
        end
    end

    always @* begin
        green = 64'b0;
        if (!crash) begin
            case (count)
                3'b000: green[2][7] = 1'b1;
                3'b001: green[2][6] = 1'b1;
                3'b010: green[2][5] = 1'b1;
                3'b011: green[2][4] = 1'b1;
                3'b100: green[2][3] = 1'b1;
                3'b101: green[2][2] = 1'b1;
                3'b110: green[2][1] = 1'b1;
                3'b111: green[2][0] = 1'b1;
                default: green = 64'b0;
            endcase
        end
    end

endmodule