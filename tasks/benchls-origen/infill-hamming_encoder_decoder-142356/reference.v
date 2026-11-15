module origen_142356 #(
    parameter n = 4,  // Data word length
    parameter m = 7,  // Hamming code word length
    parameter r = 3   // Number of redundant bits
) (
    input [n-1:0] data,
    input ctrl,
    output reg [m-1:0] hamming,
    output reg [n-1:0] corrected
);

    // Generate parity bits
    function [r-1:0] generate_parity;
        input [n-1:0] data_in;
        reg [m-1:0] extended;
        integer i, j;
        begin
            extended = 0;
            j = 0;
            for (i = 0; i < m; i++) begin
                if ((i & (i+1)) != 0) begin
                    extended[i] = data_in[j];
                    j = j + 1;
                end
            end
            for (i = 0; i < r; i++) begin
                generate_parity[i] = ^(extended & (1 << (2**i) - 1));
            end
        end
    endfunction

    // Encode data
    function [m-1:0] encode;
        input [n-1:0] data_in;
        reg [r-1:0] parity;
        reg [m-1:0] result;
        integer i, j;
        begin
            parity = generate_parity(data_in);
            j = 0;
            for (i = 0; i < m; i++) begin
                if ((i & (i+1)) == 0) begin
                    result[i] = parity[j];
                    j = j + 1;
                end else begin
                    result[i] = data_in[n-1-(i-j)];
                end
            end
            encode = result;
        end
    endfunction

    // Decode and correct
    function [n-1:0] decode;
        input [m-1:0] hamming_in;
        reg [r-1:0] syndrome;
        reg [m-1:0] corrected_hamming;
        integer error_pos, i, j;
        begin
            syndrome = 0;
            for (i = 0; i < r; i++) begin
                syndrome[i] = ^(hamming_in & (1 << (2**i) - 1));
            end
            error_pos = syndrome;
            corrected_hamming = hamming_in;
            if (error_pos != 0) begin
                corrected_hamming[error_pos-1] = ~corrected_hamming[error_pos-1];
            end
            j = 0;
            for (i = 0; i < m; i++) begin
                if ((i & (i+1)) != 0) begin
                    decode[j] = corrected_hamming[i];
                    j = j + 1;
                end
            end
        end
    endfunction

    always @(*) begin
        if (ctrl) begin
            // Encode mode
            hamming = encode(data);
            corrected = data;
        end else begin
            // Decode mode
            corrected = decode(data);
            hamming = data;
        end
    end

endmodule