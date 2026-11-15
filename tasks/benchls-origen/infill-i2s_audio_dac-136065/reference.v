module origen_136065 (
    input wire clkin,
    input wire sysclk,
    input wire we,
    input wire [15:0] pgm_address,
    input wire [15:0] pgm_data,
    input wire play,
    input wire reset,
    output reg sdout,
    output reg lrck,
    output reg mclk,
    output wire [15:0] DAC_STATUS
);

    reg [15:0] dac_address_r;
    wire [15:0] dac_address;
    wire [15:0] dac_data;
    reg [7:0] vol_reg;
    reg [7:0] vol_target_reg;
    reg [7:0] vol_latch_reg;
    reg vol_valid;
    reg [2:0] sysclk_sreg;
    wire sysclk_rising;
    reg [3:0] interpol_count;
    reg [7:0] cnt;
    reg [8:0] smpcnt;
    reg [1:0] samples;
    reg [31:0] smpshift;
    reg [2:0] reset_sreg;
    reg play_r;
    reg [2:0] lrck_sreg;
    reg [2:0] sclk_sreg;
    wire lrck_rising, lrck_falling, sclk_rising;
    reg sdout_reg;

    // Clock domain crossing
    always @(posedge clkin) begin
        sysclk_sreg <= {sysclk_sreg[1:0], sysclk};
        reset_sreg <= {reset_sreg[1:0], reset};
        lrck_sreg <= {lrck_sreg[1:0], lrck};
        sclk_sreg <= {sclk_sreg[1:0], mclk};
    end

    assign sysclk_rising = (sysclk_sreg[2:1] == 2'b01);
    assign lrck_rising = (lrck_sreg[2:1] == 2'b01);
    assign lrck_falling = (lrck_sreg[2:1] == 2'b10);
    assign sclk_rising = (sclk_sreg[2:1] == 2'b01);

    // DAC address and data
    assign dac_address = pgm_address;
    assign dac_data = pgm_data;

    // DAC status
    assign DAC_STATUS = dac_address_r;

    // Main DAC logic
    always @(posedge clkin) begin
        if (reset_sreg[2]) begin
            dac_address_r <= 16'h0000;
            vol_reg <= 8'h00;
            vol_target_reg <= 8'h00;
            vol_latch_reg <= 8'h00;
            vol_valid <= 1'b0;
            interpol_count <= 4'h0;
            cnt <= 8'h00;
            smpcnt <= 9'h000;
            samples <= 2'b00;
            smpshift <= 32'h00000000;
            play_r <= 1'b0;
            sdout_reg <= 1'b0;
            lrck <= 1'b0;
            mclk <= 1'b0;
        end else begin
            // Write enable logic
            if (we) begin
                dac_address_r <= dac_address;
                if (dac_address == 16'h0002) begin
                    vol_target_reg <= dac_data[7:0];
                    vol_valid <= 1'b1;
                end
            end

            // Play logic
            play_r <= play;

            // Clock generation
            cnt <= cnt + 1'b1;
            if (cnt == 8'h00) begin
                lrck <= ~lrck;
            end
            mclk <= cnt[1];

            // Sample counter
            if (lrck_rising) begin
                smpcnt <= smpcnt + 1'b1;
            end

            // Volume ramping
            if (lrck_rising && vol_valid) begin
                if (interpol_count == 4'h0) begin
                    if (vol_reg < vol_target_reg) begin
                        vol_reg <= vol_reg + 1'b1;
                    end else if (vol_reg > vol_target_reg) begin
                        vol_reg <= vol_reg - 1'b1;
                    end
                end
                interpol_count <= interpol_count + 1'b1;
            end

            // Sample shift register update
            if (lrck_falling) begin
                smpshift <= {smpshift[15:0], dac_data};
            end

            // Output data generation
            if (sclk_rising) begin
                sdout_reg <= smpshift[31];
                smpshift <= {smpshift[30:0], 1'b0};
            end
        end
    end

    // Output assignment
    always @(posedge clkin) begin
        sdout <= sdout_reg;
    end

endmodule