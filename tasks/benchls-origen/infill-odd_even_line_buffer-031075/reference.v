module origen_031075 (
    input wire clk,
    input wire rst_n,
    input wire [15:0] data_in_odd,
    input wire [15:0] data_in_even,
    input wire [7:0] line_address,
    input wire data_valid,
    input wire data_loading,
    output reg [15:0] data_out_odd,
    output reg [15:0] data_out_even,
    output reg output_valid,
    output reg [15:0] odd_address,
    output reg [15:0] even_address
);

    // State definition
    localparam IDLE = 2'b00;
    localparam LOAD = 2'b01;
    localparam CAL  = 2'b10;

    reg [1:0] state, next_state;
    reg [16:0] odd_data [31:0];
    reg [16:0] even_data [31:0];
    reg [4:0] data_counter;
    reg [4:0] cal_counter;
    reg [7:0] odd_offset, even_offset;
    integer i;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: next_state = data_valid ? LOAD : IDLE;
            LOAD: next_state = (data_counter == 5'd31) ? CAL : LOAD;
            CAL:  next_state = (cal_counter == 5'd31) ? IDLE : CAL;
            default: next_state = IDLE;
        endcase
    end

    // Data loading
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_counter <= 5'd0;
            for (i = 0; i < 32; i = i + 1) begin
                odd_data[i] <= 17'd0;
                even_data[i] <= 17'd0;
            end
        end else if (state == LOAD && data_loading) begin
            odd_data[data_counter] <= {data_in_odd[15], data_in_odd};
            even_data[data_counter] <= {data_in_even[15], data_in_even};
            data_counter <= data_counter + 1'b1;
        end else if (state == IDLE) begin
            data_counter <= 5'd0;
        end
    end

    // Wavelet transform calculation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cal_counter <= 5'd0;
            odd_offset <= 8'd0;
            even_offset <= 8'd0;
            output_valid <= 1'b0;
        end else if (state == CAL) begin
            // Update odd samples
            if (cal_counter == 5'd0) begin
                odd_data[cal_counter] <= odd_data[cal_counter] - ((even_data[cal_counter] + even_data[cal_counter+1]) >>> 1);
            end else if (cal_counter == 5'd31) begin
                odd_data[cal_counter] <= odd_data[cal_counter] - ((even_data[cal_counter-1] + even_data[cal_counter]) >>> 1);
            end else begin
                odd_data[cal_counter] <= odd_data[cal_counter] - ((even_data[cal_counter-1] + even_data[cal_counter+1]) >>> 1);
            end

            // Update even samples
            if (cal_counter == 5'd0) begin
                even_data[cal_counter] <= even_data[cal_counter] + ((odd_data[cal_counter] + odd_data[cal_counter+1]) >>> 2);
            end else if (cal_counter == 5'd31) begin
                even_data[cal_counter] <= even_data[cal_counter] + ((odd_data[cal_counter-1] + odd_data[cal_counter]) >>> 2);
            end else begin
                even_data[cal_counter] <= even_data[cal_counter] + ((odd_data[cal_counter-1] + odd_data[cal_counter+1]) >>> 2);
            end

            // Output data
            data_out_odd <= odd_data[cal_counter][16:1];
            data_out_even <= even_data[cal_counter][16:1];
            output_valid <= 1'b1;

            // Update counters and offsets
            cal_counter <= cal_counter + 1'b1;
            odd_offset <= odd_offset + 1'b1;
            even_offset <= even_offset + 1'b1;
        end else begin
            cal_counter <= 5'd0;
            output_valid <= 1'b0;
        end
    end

    // Address generation
    always @(*) begin
        odd_address = {line_address, odd_offset};
        even_address = {line_address, even_offset};
    end

endmodule