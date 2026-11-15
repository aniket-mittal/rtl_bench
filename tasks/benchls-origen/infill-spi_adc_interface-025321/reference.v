module origen_025321 (
    input wire user_clk,
    input wire user_rst,
    input wire MISO,
    input wire user_in,
    input wire user_enable,
    output reg user_status_out,
    output wire srst,
    output reg SS,
    output reg MOSI
);

    reg [2:0] s2p_count;
    reg [5:0] temp_s2p_out, user_s2p_out;
    reg user_s2p_ready;
    reg [4:0] count;
    reg [1:0] dec_addr;
    reg [3:0] dec_data;
    reg spi_status;
    reg [18:0] spi_out;
    
    localparam [14:0] adc_addr = 15'h0190;

    assign srst = user_rst;

    // Serial to Parallel Conversion
    always @(posedge user_clk or negedge user_rst) begin
        if (!user_rst) begin
            s2p_count <= 3'b0;
            temp_s2p_out <= 6'b0;
            user_s2p_out <= 6'b0;
            user_s2p_ready <= 1'b0;
        end else if (user_enable) begin
            if (s2p_count == 3'b101) begin
                user_s2p_out <= temp_s2p_out;
                user_s2p_ready <= 1'b1;
                s2p_count <= 3'b0;
            end else begin
                temp_s2p_out <= {temp_s2p_out[4:0], user_in};
                s2p_count <= s2p_count + 1'b1;
                user_s2p_ready <= 1'b0;
            end
        end else begin
            user_s2p_ready <= 1'b0;
        end
    end

    // Address and Data Decoding
    always @(posedge user_clk or negedge user_rst) begin
        if (!user_rst) begin
            dec_addr <= 2'b0;
            dec_data <= 4'b0;
        end else if (user_s2p_ready) begin
            dec_addr <= user_s2p_out[5:4];
            dec_data <= user_s2p_out[3:0];
        end
    end

    // SPI Communication
    always @(posedge user_clk or negedge user_rst) begin
        if (!user_rst) begin
            count <= 5'b0;
            spi_status <= 1'b0;
            SS <= 1'b1;
            MOSI <= 1'b0;
            spi_out <= 19'b0;
        end else if (dec_addr == 2'b11) begin
            if (count == 5'b0) begin
                spi_status <= MISO;
                SS <= 1'b0;
                spi_out <= {adc_addr, dec_data};
                count <= count + 1'b1;
                MOSI <= spi_out[18];
            end else if (count < 5'b10011) begin
                count <= count + 1'b1;
                MOSI <= spi_out[18 - count];
            end else begin
                SS <= 1'b1;
                count <= 5'b0;
            end
        end else begin
            SS <= 1'b1;
            count <= 5'b0;
        end
    end

    // Status Output
    always @(posedge user_clk or negedge user_rst) begin
        if (!user_rst) begin
            user_status_out <= 1'b0;
        end else begin
            user_status_out <= spi_status;
        end
    end

endmodule