module origen_169545(
    input           LR_CK,
    input           BIT_CK,
    input           DIN,
    input           RESET,
    output [15:0]   DATA_L,
    output [15:0]   DATA_R,
    output          STROBE,
    output          STROBE_LR
);

    reg [15:0] shift_reg;
    reg [3:0]  counter;
    reg [15:0] DATA_L_reg;
    reg [15:0] DATA_R_reg;
    reg        STROBE_LR_reg;
    reg        output_strobed;

    always @(posedge BIT_CK or posedge RESET) begin
        if (RESET) begin
            shift_reg <= 16'b0;
            counter <= 4'b1111;
            DATA_L_reg <= 16'b0;
            DATA_R_reg <= 16'b0;
            STROBE_LR_reg <= 1'b0;
            output_strobed <= 1'b0;
        end else begin
            shift_reg <= {shift_reg[14:0], DIN};
            counter <= counter - 1'b1;

            if (counter == 0) begin
                if (LR_CK) begin
                    DATA_L_reg <= shift_reg;
                    STROBE_LR_reg <= 1'b0;
                end else begin
                    DATA_R_reg <= shift_reg;
                    STROBE_LR_reg <= 1'b1;
                end
                counter <= 4'b1111;
                output_strobed <= 1'b0;
            end
        end
    end

    assign DATA_L = DATA_L_reg;
    assign DATA_R = DATA_R_reg;
    assign STROBE = (counter == 0) && !output_strobed;
    assign STROBE_LR = STROBE_LR_reg;

    always @(posedge STROBE) begin
        output_strobed <= 1'b1;
    end

endmodule