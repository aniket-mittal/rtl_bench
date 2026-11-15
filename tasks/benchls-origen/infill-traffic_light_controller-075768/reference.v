module origen_075768(
    input wire Sa, Sb,
    output reg [2:0] LightA, LightB
);
    parameter R = 3'b100, Y = 3'b010, G = 3'b001;
    wire clk;
    wire Ra, Ya, Ga, Rb, Yb, Gb;

    CLK clock(.clk_out(clk));
    Traffic_Light_ControlBox control(
        .clk_input(clk),
        .Sa(Sa), .Sb(Sb),
        .Ra(Ra), .Ya(Ya), .Ga(Ga),
        .Rb(Rb), .Yb(Yb), .Gb(Gb)
    );

    always @(*) begin
        LightA = Ra ? R : (Ya ? Y : G);
        LightB = Rb ? R : (Yb ? Y : G);
    end
endmodule

module Traffic_Light_ControlBox(
    input wire clk_input, Sa, Sb,
    output reg Ra, Ya, Ga, Rb, Yb, Gb
);
    reg [3:0] state;
    reg [5:0] counter;

    initial begin
        state = 4'd0;
        counter = 6'd0;
        {Ra, Ya, Ga, Rb, Yb, Gb} = 6'b001100;
    end

    always @(posedge clk_input) begin
        case(state)
            4'd0, 4'd1, 4'd2, 4'd3, 4'd4: begin
                {Ra, Ya, Ga, Rb, Yb, Gb} <= 6'b001100;
                if (counter == 6'd49) begin
                    state <= 4'd5;
                    counter <= 6'd0;
                end else begin
                    counter <= counter + 1;
                end
            end
            4'd5: begin
                if (Sb) begin
                    state <= 4'd6;
                    counter <= 6'd0;
                end else begin
                    state <= 4'd0;
                    counter <= 6'd0;
                end
            end
            4'd6: begin
                {Ra, Ya, Ga, Rb, Yb, Gb} <= 6'b010100;
                if (counter == 6'd9) begin
                    state <= 4'd7;
                    counter <= 6'd0;
                end else begin
                    counter <= counter + 1;
                end
            end
            4'd7, 4'd8, 4'd9, 4'd10: begin
                {Ra, Ya, Ga, Rb, Yb, Gb} <= 6'b100001;
                if (counter == 6'd39) begin
                    state <= 4'd11;
                    counter <= 6'd0;
                end else begin
                    counter <= counter + 1;
                end
            end
            4'd11: begin
                if (Sa || !Sb) begin
                    state <= 4'd12;
                    counter <= 6'd0;
                end else begin
                    state <= 4'd7;
                    counter <= 6'd0;
                end
            end
            4'd12: begin
                {Ra, Ya, Ga, Rb, Yb, Gb} <= 6'b100010;
                if (counter == 6'd9) begin
                    state <= 4'd0;
                    counter <= 6'd0;
                end else begin
                    counter <= counter + 1;
                end
            end
            default: state <= 4'd0;
        endcase
    end
endmodule

module CLK(
    output reg clk_out
);
    initial clk_out = 0;
    always #5 clk_out = ~clk_out;
endmodule