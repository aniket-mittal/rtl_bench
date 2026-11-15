module origen_088206(
    input clk, rst, start,
    output reg selmixcol, seldata, selmsb, sellsb,
    output reg [1:0] selkeyschedule,
    output [3:0] roundcount
);

    // State encoding
    parameter IDLE = 3'b000;
    parameter ROUND0 = 3'b001;
    parameter ROUND1 = 3'b010;
    parameter ROUND2_13 = 3'b011;
    parameter FINALROUND = 3'b100;

    reg [2:0] CS, NS;
    reg [3:0] count;
    reg temp_selmsb, temp_sellsb, temp_selmixcol, temp_seldata;
    reg [1:0] temp_selkeyschedule;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            CS <= IDLE;
        else
            CS <= NS;
    end

    // Next state logic
    always @(*) begin
        case (CS)
            IDLE: NS = start ? ROUND0 : IDLE;
            ROUND0: NS = ROUND1;
            ROUND1: NS = ROUND2_13;
            ROUND2_13: NS = (count == 4'd13) ? FINALROUND : ROUND2_13;
            FINALROUND: NS = IDLE;
            default: NS = IDLE;
        endcase
    end

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0;
        else if (CS == ROUND0)
            count <= 4'b0;
        else if (CS == ROUND2_13 || CS == ROUND1)
            count <= count + 1'b1;
    end

    // Output logic
    always @(*) begin
        temp_selmsb = 1'b0;
        temp_sellsb = 1'b0;
        temp_selmixcol = 1'b0;
        temp_seldata = 1'b0;
        temp_selkeyschedule = 2'b00;

        case (CS)
            IDLE: begin
                // All signals are already set to 0
            end
            ROUND0: begin
                // All signals remain 0
            end
            ROUND1: begin
                temp_seldata = 1'b1;
                temp_selkeyschedule = 2'b01;
            end
            ROUND2_13: begin
                temp_selmsb = 1'b1;
                temp_selkeyschedule = (count[0] == 1'b0) ? 2'b10 : 2'b11;
                temp_sellsb = (count == 4'd12) ? 1'b1 : 1'b0;
            end
            FINALROUND: begin
                temp_selmsb = 1'b1;
                temp_sellsb = 1'b1;
                temp_seldata = 1'b1;
                temp_selkeyschedule = 2'b11;
            end
        endcase
    end

    // Output assignment
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            selmixcol <= 1'b0;
            seldata <= 1'b0;
            selmsb <= 1'b0;
            sellsb <= 1'b0;
            selkeyschedule <= 2'b00;
        end else begin
            selmixcol <= temp_selmixcol;
            seldata <= temp_seldata;
            selmsb <= temp_selmsb;
            sellsb <= temp_sellsb;
            selkeyschedule <= temp_selkeyschedule;
        end
    end

    // Round count output
    assign roundcount = count;

endmodule