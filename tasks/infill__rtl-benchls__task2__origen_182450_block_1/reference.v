module origen_182450(
    input OSC_50,
    input OSC,
    input rst,
    input [3:0] KEY,
    output reg [1:0] control,
    output t0,
    output t1,
    output t2
);

    reg flag0, flag1, flag2;
    reg OSC_double;

    always @(posedge OSC_50) begin
        if (rst) begin
            flag0 <= 1'b0;
            flag1 <= 1'b0;
            flag2 <= 1'b0;
            OSC_double <= 1'b0;
        end
        else begin
            OSC_double <= ~OSC_double;
            if (OSC_double) begin
                flag0 <= 1'b0;
                flag1 <= 1'b0;
                flag2 <= 1'b0;
            end
            else begin
                if (~KEY[0]) flag0 <= 1'b1;
                if (~KEY[1]) flag1 <= 1'b1;
                if (~KEY[2]) flag2 <= 1'b1;
            end
        end
    end

    always @(posedge OSC) begin
        if (rst) begin
            control <= 2'b11;
        end
        else begin
            if (flag0) control <= 2'b00;
            else if (flag1) control <= 2'b01;
            else if (flag2) control <= 2'b10;
            else control <= 2'b11;
        end
    end

    assign t0 = flag0;
    assign t1 = flag1;
    assign t2 = flag2;

endmodule