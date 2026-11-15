module origen_018549 (
    input wire clk,
    input wire [7:0] bt656_in,
    output reg [15:0] yc_data_out,
    output reg vs,
    output reg hs,
    output reg field,
    output reg de,
    output reg is_pal
);

    reg [7:0] bt656_d1, bt656_d2;
    reg [10:0] pixel_cnt;
    reg [9:0] y_cnt;
    reg trs_detected;
    reg [2:0] h_state;
    reg [1:0] v_state;
    reg de_d1, de_d2;
    reg hs_d1, hs_d2;
    reg vs_d1, vs_d2;

    // TRS detection
    always @(posedge clk) begin
        bt656_d1 <= bt656_in;
        bt656_d2 <= bt656_d1;
        trs_detected <= (bt656_d2 == 8'h00 && bt656_d1 == 8'h00 && bt656_in == 8'hFF);
    end

    // Pixel counter
    always @(posedge clk) begin
        if (trs_detected)
            pixel_cnt <= 0;
        else if (pixel_cnt < 1439)
            pixel_cnt <= pixel_cnt + 1;
    end

    // Horizontal sync state machine
    always @(posedge clk) begin
        if (trs_detected) begin
            case (bt656_in)
                8'h80: h_state <= 3'b001; // EAV
                8'hAB: h_state <= 3'b010; // SAV
                default: h_state <= 3'b000;
            endcase
        end else begin
            h_state <= 3'b000;
        end
    end

    // Vertical sync state machine
    always @(posedge clk) begin
        if (h_state == 3'b001) begin // EAV detected
            case (bt656_in)
                8'hB6: v_state <= 2'b01; // Field 1
                8'h9D: v_state <= 2'b10; // Field 2
                default: v_state <= 2'b00;
            endcase
        end
    end

    // Generate sync signals
    always @(posedge clk) begin
        hs <= (h_state == 3'b001);
        vs <= (v_state != 2'b00);
        field <= (v_state == 2'b10);
        de <= (pixel_cnt > 0 && pixel_cnt <= 1440 && h_state == 3'b000);
    end

    // Line counter
    always @(posedge clk) begin
        if (vs)
            y_cnt <= 0;
        else if (h_state == 3'b001)
            y_cnt <= y_cnt + 1;
    end

    // PAL detection
    always @(posedge clk) begin
        if (vs)
            is_pal <= (y_cnt > 280);
    end

    // YC data output
    always @(posedge clk) begin
        yc_data_out <= {bt656_d1, bt656_in};
    end

    // Delay signals for timing alignment
    always @(posedge clk) begin
        de_d1 <= de;
        de_d2 <= de_d1;
        de <= de_d2;

        hs_d1 <= hs;
        hs_d2 <= hs_d1;
        hs <= hs_d2;

        vs_d1 <= vs;
        vs_d2 <= vs_d1;
        vs <= vs_d2;
    end

endmodule