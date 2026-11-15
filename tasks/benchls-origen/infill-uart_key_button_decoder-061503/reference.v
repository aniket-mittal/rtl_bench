module origen_061503(
    input wire clk,
    input wire rst,
    input wire [7:0] uart_data,
    output reg btnAttack,
    output reg btnUp,
    output reg btnLeft,
    output reg btnRight,
    output reg btnDown
);

    reg btnAttack_next, btnUp_next, btnLeft_next, btnRight_next, btnDown_next;

    // Sequential logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            btnAttack <= 1'b0;
            btnUp <= 1'b0;
            btnLeft <= 1'b0;
            btnRight <= 1'b0;
            btnDown <= 1'b0;
        end else begin
            btnAttack <= btnAttack_next;
            btnUp <= btnUp_next;
            btnLeft <= btnLeft_next;
            btnRight <= btnRight_next;
            btnDown <= btnDown_next;
        end
    end

    // Combinational logic
    always @(*) begin
        btnAttack_next = 1'b0;
        btnUp_next = 1'b0;
        btnLeft_next = 1'b0;
        btnRight_next = 1'b0;
        btnDown_next = 1'b0;

        case (uart_data)
            8'h77: btnUp_next = 1'b1;    // 'w'
            8'h73: btnDown_next = 1'b1;  // 's'
            8'h61: btnLeft_next = 1'b1;  // 'a'
            8'h64: btnRight_next = 1'b1; // 'd'
            8'h20: btnAttack_next = 1'b1; // space
            default: begin
                btnAttack_next = 1'b0;
                btnUp_next = 1'b0;
                btnLeft_next = 1'b0;
                btnRight_next = 1'b0;
                btnDown_next = 1'b0;
            end
        endcase
    end

endmodule