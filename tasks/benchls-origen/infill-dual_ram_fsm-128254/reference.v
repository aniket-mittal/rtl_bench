module origen_128254 (
    input wire clk,
    input wire reset,
    input wire sel,
    input wire [5:0] addr,
    input wire w,
    input wire [197:0] data,
    output reg [197:0] out,
    output reg done
);

    // Internal signals
    reg [5:0] ram_a_addr, ram_b_addr;
    reg [197:0] ram_a_data_out, ram_b_data_out;
    reg [197:0] ram_b_data_in;
    reg [197:0] const0_out, const1_out;
    reg [197:0] muxer0_out, muxer1_out;
    reg const0_effective, const1_effective;
    
    // FSM states
    localparam IDLE = 2'b00;
    localparam PROCESS = 2'b01;
    localparam WRITE = 2'b10;
    localparam FINISH = 2'b11;
    
    reg [1:0] state, next_state;

    // RAM A
    always @(posedge clk) begin
        if (w && !sel)
            ram_a_data_out <= data;
    end

    // RAM B
    always @(posedge clk) begin
        if (w && sel)
            ram_b_data_out <= data;
        else if (state == WRITE)
            ram_b_data_out <= ram_b_data_in;
    end

    // Address selection
    always @(*) begin
        if (sel) begin
            ram_a_addr = addr;
            ram_b_addr = addr;
        end else begin
            ram_a_addr = addr;
            ram_b_addr = 6'b0;
        end
    end

    // Constant value selection
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            const0_out <= 198'b0;
            const1_out <= 198'b0;
        end else begin
            if (const0_effective)
                const0_out <= ram_a_data_out;
            if (const1_effective)
                const1_out <= ram_b_data_out;
        end
    end

    // Multiplexer selection
    always @(*) begin
        muxer0_out = (ram_a_addr[5]) ? const0_out : ram_a_data_out;
        muxer1_out = (ram_b_addr[5]) ? const1_out : ram_b_data_out;
    end

    // Processing element
    always @(*) begin
        ram_b_data_in = muxer0_out + muxer1_out; // Example operation
    end

    // FSM
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        done = 1'b0;
        const0_effective = 1'b0;
        const1_effective = 1'b0;

        case (state)
            IDLE: begin
                if (w)
                    next_state = PROCESS;
            end
            PROCESS: begin
                const0_effective = 1'b1;
                const1_effective = 1'b1;
                next_state = WRITE;
            end
            WRITE: begin
                next_state = FINISH;
            end
            FINISH: begin
                done = 1'b1;
                next_state = IDLE;
            end
        endcase
    end

    // Output
    always @(posedge clk) begin
        if (state == FINISH)
            out <= ram_b_data_out;
    end

endmodule