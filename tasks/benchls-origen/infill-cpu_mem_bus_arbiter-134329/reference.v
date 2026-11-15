module origen_134329 (
    input wire clk,
    input wire reset_n,
    input wire [31:0] d_readdata,
    input wire d_waitrequest,
    input wire [31:0] i_readdata,
    input wire i_waitrequest,
    input wire irq,
    input wire [8:0] debug_mem_slave_address,
    input wire [3:0] debug_mem_slave_byteenable,
    input wire debug_mem_slave_debugaccess,
    input wire debug_mem_slave_read,
    input wire debug_mem_slave_write,
    input wire [31:0] debug_mem_slave_writedata,
    
    output reg [31:0] d_address,
    output reg [3:0] d_byteenable,
    output reg d_read,
    output reg d_write,
    output reg [31:0] d_writedata,
    output reg [31:0] debug_mem_slave_readdata,
    output reg debug_mem_slave_waitrequest,
    output reg [31:0] i_address,
    output reg i_read,
    output reg debug_mem_slave_debugaccess_to_roms,
    output reg debug_reset_request,
    output reg dummy_ci_port
);

    // Internal registers
    reg [31:0] data_buffer;
    reg [31:0] instr_buffer;
    reg debug_access_in_progress;

    // State machine states
    localparam IDLE = 2'b00;
    localparam DATA_ACCESS = 2'b01;
    localparam INSTR_ACCESS = 2'b10;
    localparam DEBUG_ACCESS = 2'b11;

    reg [1:0] state;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            d_address <= 32'b0;
            d_byteenable <= 4'b0;
            d_read <= 1'b0;
            d_write <= 1'b0;
            d_writedata <= 32'b0;
            debug_mem_slave_readdata <= 32'b0;
            debug_mem_slave_waitrequest <= 1'b0;
            i_address <= 32'b0;
            i_read <= 1'b0;
            debug_mem_slave_debugaccess_to_roms <= 1'b0;
            debug_reset_request <= 1'b0;
            dummy_ci_port <= 1'b0;
            data_buffer <= 32'b0;
            instr_buffer <= 32'b0;
            debug_access_in_progress <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (debug_mem_slave_read || debug_mem_slave_write) begin
                        state <= DEBUG_ACCESS;
                        debug_access_in_progress <= 1'b1;
                        debug_mem_slave_waitrequest <= 1'b1;
                    end else if (d_read || d_write) begin
                        state <= DATA_ACCESS;
                    end else if (i_read) begin
                        state <= INSTR_ACCESS;
                    end
                end

                DATA_ACCESS: begin
                    if (!d_waitrequest) begin
                        if (d_read) begin
                            data_buffer <= d_readdata;
                        end
                        state <= IDLE;
                        d_read <= 1'b0;
                        d_write <= 1'b0;
                    end
                end

                INSTR_ACCESS: begin
                    if (!i_waitrequest) begin
                        instr_buffer <= i_readdata;
                        state <= IDLE;
                        i_read <= 1'b0;
                    end
                end

                DEBUG_ACCESS: begin
                    if (debug_mem_slave_debugaccess) begin
                        debug_mem_slave_debugaccess_to_roms <= 1'b1;
                    end

                    if (debug_mem_slave_read) begin
                        debug_mem_slave_readdata <= data_buffer;
                    end else if (debug_mem_slave_write) begin
                        d_writedata <= debug_mem_slave_writedata;
                        d_byteenable <= debug_mem_slave_byteenable;
                        d_address <= {23'b0, debug_mem_slave_address};
                        d_write <= 1'b1;
                    end

                    debug_mem_slave_waitrequest <= 1'b0;
                    debug_access_in_progress <= 1'b0;
                    state <= IDLE;
                end
            endcase

            // Handle interrupt and debug reset request
            if (irq) begin
                // Implement interrupt handling logic here
            end

            if (debug_mem_slave_debugaccess && debug_mem_slave_write && debug_mem_slave_address == 9'h100) begin
                debug_reset_request <= 1'b1;
            end else begin
                debug_reset_request <= 1'b0;
            end

            // Dummy custom instruction port (not used in this implementation)
            dummy_ci_port <= 1'b0;
        end
    end

endmodule