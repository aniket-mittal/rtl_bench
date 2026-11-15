module origen_043048 (
    input wire clock,
    input wire rst_n,
    input wire size_valid,
    input wire data_start,
    input wire [31:0] size,
    input wire [7:0] data,
    output wire checksum_valid,
    output wire [31:0] checksum
);

    wire [1:0] decision;

    controller U1 (
        .clock(clock),
        .rst_n(rst_n),
        .size_valid(size_valid),
        .data_start(data_start),
        .inSize(size),
        .decision(decision)
    );

    dataPath U2 (
        .clock(clock),
        .rst_n(rst_n),
        .decision(decision),
        .data(data),
        .checksum_valid(checksum_valid),
        .checksum(checksum)
    );

endmodule

module controller (
    input wire clock,
    input wire rst_n,
    input wire size_valid,
    input wire data_start,
    input wire [31:0] inSize,
    output reg [1:0] decision
);

    reg [31:0] remaining_size;

    always @(posedge clock or negedge rst_n) begin
        if (!rst_n) begin
            decision <= 2'b11;
            remaining_size <= 32'b0;
        end else begin
            case (decision)
                2'b00: begin // Calculation complete
                    if (size_valid) begin
                        decision <= 2'b10;
                        remaining_size <= inSize;
                    end
                end
                2'b01: begin // Processing data
                    if (remaining_size == 32'b1) begin
                        decision <= 2'b00;
                    end
                    remaining_size <= remaining_size - 1;
                end
                2'b10: begin // Initialize for new calculation
                    if (data_start) begin
                        decision <= 2'b01;
                    end
                end
                2'b11: begin // Reset state
                    decision <= 2'b00;
                end
            endcase
        end
    end

endmodule

module dataPath (
    input wire clock,
    input wire rst_n,
    input wire [1:0] decision,
    input wire [7:0] data,
    output reg checksum_valid,
    output reg [31:0] checksum
);

    reg [15:0] A, B;

    always @(posedge clock or negedge rst_n) begin
        if (!rst_n) begin
            A <= 16'h0001;
            B <= 16'h0000;
            checksum_valid <= 1'b0;
            checksum <= 32'b0;
        end else begin
            case (decision)
                2'b00: begin // Calculation complete
                    checksum_valid <= 1'b1;
                    checksum <= {B, A};
                end
                2'b01: begin // Processing data
                    A <= (A + data) % 16'd65521;
                    B <= (B + A) % 16'd65521;
                    checksum_valid <= 1'b0;
                end
                2'b10: begin // Initialize for new calculation
                    A <= 16'h0001;
                    B <= 16'h0000;
                    checksum_valid <= 1'b0;
                    checksum <= 32'b0;
                end
                2'b11: begin // Reset state
                    A <= 16'h0001;
                    B <= 16'h0000;
                    checksum_valid <= 1'b0;
                    checksum <= 32'b0;
                end
            endcase
        end
    end

endmodule