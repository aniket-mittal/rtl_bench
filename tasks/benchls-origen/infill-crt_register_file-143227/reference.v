module origen_143227 (
    input wire I_RSTn,
    input wire I_E,
    input wire [7:0] I_DI,
    input wire I_RS,
    input wire I_RWn,
    input wire I_CSn,
    
    output reg [7:0] O_Nht,
    output reg [7:0] O_Nhd,
    output reg [7:0] O_Nhsp,
    output reg [7:0] O_Nhsw,
    output reg [7:0] O_Nvt,
    output reg [7:0] O_Nadj,
    output reg [7:0] O_Nvd,
    output reg [7:0] O_Nvsp,
    output reg [7:0] O_Nvsw,
    output reg [7:0] O_Nr,
    output reg [15:0] O_Msa,
    output reg [7:0] O_DScue,
    output reg [7:0] O_CScue,
    output reg [7:0] O_VMode,
    output reg O_IntSync
);

    // Internal registers
    reg [7:0] reg_file [0:15];
    reg [3:0] addr_ptr;

    // Write operation
    always @(negedge I_E or negedge I_RSTn) begin
        if (!I_RSTn) begin
            // Reset all registers
            integer i;
            for (i = 0; i < 16; i = i + 1) begin
                reg_file[i] <= 8'h00;
            end
            addr_ptr <= 4'h0;
        end else if (!I_CSn && !I_RWn) begin
            if (I_RS) begin
                // Write to register file
                reg_file[addr_ptr] <= I_DI;
                addr_ptr <= addr_ptr + 1;
            end else begin
                // Set address pointer
                addr_ptr <= I_DI[3:0];
            end
        end
    end

    // Read operation
    always @(posedge I_E or negedge I_RSTn) begin
        if (!I_RSTn) begin
            // Reset all outputs
            O_Nht <= 8'h00;
            O_Nhd <= 8'h00;
            O_Nhsp <= 8'h00;
            O_Nhsw <= 8'h00;
            O_Nvt <= 8'h00;
            O_Nadj <= 8'h00;
            O_Nvd <= 8'h00;
            O_Nvsp <= 8'h00;
            O_Nvsw <= 8'h00;
            O_Nr <= 8'h00;
            O_Msa <= 16'h0000;
            O_DScue <= 8'h00;
            O_CScue <= 8'h00;
            O_VMode <= 8'h00;
            O_IntSync <= 1'b0;
        end else if (!I_CSn && I_RWn) begin
            case (addr_ptr)
                4'h0: O_Nht <= reg_file[0];
                4'h1: O_Nhd <= reg_file[1];
                4'h2: O_Nhsp <= reg_file[2];
                4'h3: O_Nhsw <= reg_file[3];
                4'h4: O_Nvt <= reg_file[4];
                4'h5: O_Nadj <= reg_file[5];
                4'h6: O_Nvd <= reg_file[6];
                4'h7: O_Nvsp <= reg_file[7];
                4'h8: O_Nvsw <= reg_file[8];
                4'h9: O_Nr <= reg_file[9];
                4'hA: O_Msa[7:0] <= reg_file[10];
                4'hB: O_Msa[15:8] <= reg_file[11];
                4'hC: O_DScue <= reg_file[12];
                4'hD: O_CScue <= reg_file[13];
                4'hE: O_VMode <= reg_file[14];
                4'hF: O_IntSync <= reg_file[15][0];
            endcase
        end
    end

endmodule