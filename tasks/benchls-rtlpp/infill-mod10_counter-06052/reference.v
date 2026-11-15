module rtlpp_06052 (
    clock,
    cnt_en,
    sclr,
    cout,
    q
);

    input clock;
    input cnt_en;
    input sclr;
    output cout;
    output [3:0] q;

    reg [3:0] counter;
    reg cout_reg;
    wire [3:0] modulus_bus = 4'b1010;

    assign cout = cout_reg;
    assign q = counter;

    always @(posedge clock or posedge sclr) begin
        if (sclr) begin
            counter <= 4'b0000;
            cout_reg <= 0;
        end else if (cnt_en) begin
            if (counter == modulus_bus) begin
                counter <= 4'b0000;
                cout_reg <= 1;
            end else begin
                counter <= counter + 4'b0001;
                cout_reg <= 0;
            end
        end
    end
endmodule