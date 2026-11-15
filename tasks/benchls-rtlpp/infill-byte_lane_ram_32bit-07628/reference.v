module rtlpp_07628 (
               CLK, 
               CE, WE, SEL, 
               ADR, DATI, DATO
           );

    input CLK;           
    input CE;            
    input WE;            
    input [3:0] SEL;      
    input [13:0] ADR;    
    input [31:0] DATI;   
    output [31:0] DATO;

    reg [7:0] RAM0HH [0:511];
    reg [7:0] RAM0HL [0:511];
    reg [7:0] RAM0LH [0:511];
    reg [7:0] RAM0LL [0:511];
    reg [7:0] RAM1HH [0:511];
    reg [7:0] RAM1HL [0:511];
    reg [7:0] RAM1LH [0:511];
    reg [7:0] RAM1LL [0:511];
    reg [7:0] RAM2HH [0:511];
    reg [7:0] RAM2HL [0:511];
    reg [7:0] RAM2LH [0:511];
    reg [7:0] RAM2LL [0:511];
    reg [7:0] RAM3HH [0:511];
    reg [7:0] RAM3HL [0:511];
    reg [7:0] RAM3LH [0:511];
    reg [7:0] RAM3LL [0:511];
    reg [7:0] RAM4HH [0:511];
    reg [7:0] RAM4HL [0:511];
    reg [7:0] RAM4LH [0:511];
    reg [7:0] RAM4LL [0:511];
    reg [7:0] RAM5HH [0:511];
    reg [7:0] RAM5HL [0:511];
    reg [7:0] RAM5LH [0:511];
    reg [7:0] RAM5LL [0:511];
    reg [7:0] RAM6HH [0:511];
    reg [7:0] RAM6HL [0:511];
    reg [7:0] RAM6LH [0:511];
    reg [7:0] RAM6LL [0:511];
    reg [7:0] RAM7HH [0:511];
    reg [7:0] RAM7HL [0:511];
    reg [7:0] RAM7LH [0:511];
    reg [7:0] RAM7LL [0:511];

    reg [31:0] DATOUT0;
    reg [31:0] DATOUT1;
    reg [31:0] DATOUT2;
    reg [31:0] DATOUT3;
    reg [31:0] DATOUT4;
    reg [31:0] DATOUT5;
    reg [31:0] DATOUT6;
    reg [31:0] DATOUT7;

    reg [8:0] ADR_RD;
    reg [7:0] CERAM;

    always @(ADR or CE)
    begin
        case ({CE, ADR[13:11]})
            4'b1_000: CERAM <= 8'b00000001;
            4'b1_001: CERAM <= 8'b00000010;
            4'b1_010: CERAM <= 8'b00000100;
            4'b1_011: CERAM <= 8'b00001000;
            4'b1_100: CERAM <= 8'b00010000;
            4'b1_101: CERAM <= 8'b00100000;
            4'b1_110: CERAM <= 8'b01000000;
            4'b1_111: CERAM <= 8'b10000000;
            default:  CERAM <= 8'b00000000;
        endcase
    end

    always @(negedge CLK) begin
        if (CERAM[0] & WE & SEL[3]) RAM0HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[0] & WE & SEL[2]) RAM0HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[0] & WE & SEL[1]) RAM0LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[0] & WE & SEL[0]) RAM0LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[1] & WE & SEL[3]) RAM1HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[1] & WE & SEL[2]) RAM1HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[1] & WE & SEL[1]) RAM1LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[1] & WE & SEL[0]) RAM1LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[2] & WE & SEL[3]) RAM2HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[2] & WE & SEL[2]) RAM2HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[2] & WE & SEL[1]) RAM2LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[2] & WE & SEL[0]) RAM2LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[3] & WE & SEL[3]) RAM3HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[3] & WE & SEL[2]) RAM3HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[3] & WE & SEL[1]) RAM3LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[3] & WE & SEL[0]) RAM3LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[4] & WE & SEL[3]) RAM4HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[4] & WE & SEL[2]) RAM4HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[4] & WE & SEL[1]) RAM4LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[4] & WE & SEL[0]) RAM4LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[5] & WE & SEL[3]) RAM5HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[5] & WE & SEL[2]) RAM5HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[5] & WE & SEL[1]) RAM5LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[5] & WE & SEL[0]) RAM5LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[6] & WE & SEL[3]) RAM6HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[6] & WE & SEL[2]) RAM6HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[6] & WE & SEL[1]) RAM6LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[6] & WE & SEL[0]) RAM6LL[ADR[10:2]] <= DATI[7:0];
        if (CERAM[7] & WE & SEL[3]) RAM7HH[ADR[10:2]] <= DATI[31:24];
        if (CERAM[7] & WE & SEL[2]) RAM7HL[ADR[10:2]] <= DATI[23:16];
        if (CERAM[7] & WE & SEL[1]) RAM7LH[ADR[10:2]] <= DATI[15:8];
        if (CERAM[7] & WE & SEL[0]) RAM7LL[ADR[10:2]] <= DATI[7:0];
        ADR_RD <= ADR[10:2];
    end

    always @(*) begin
        DATOUT0 = 32'h00000000;
        if (CERAM[0]) begin
            DATOUT0[31:24] = RAM0HH[ADR_RD];
            DATOUT0[23:16] = RAM0HL[ADR_RD];
            DATOUT0[15:8] = RAM0LH[ADR_RD];
            DATOUT0[7:0] = RAM0LL[ADR_RD];
        end

        DATOUT1 = 32'h00000000;
        if (CERAM[1]) begin
            DATOUT1[31:24] = RAM1HH[ADR_RD];
            DATOUT1[23:16] = RAM1HL[ADR_RD];
            DATOUT1[15:8] = RAM1LH[ADR_RD];
            DATOUT1[7:0] = RAM1LL[ADR_RD];
        end

        DATOUT2 = 32'h00000000;
        if (CERAM[2]) begin
            DATOUT2[31:24] = RAM2HH[ADR_RD];
            DATOUT2[23:16] = RAM2HL[ADR_RD];
            DATOUT2[15:8] = RAM2LH[ADR_RD];
            DATOUT2[7:0] = RAM2LL[ADR_RD];
        end

        DATOUT3 = 32'h00000000;
        if (CERAM[3]) begin
            DATOUT3[31:24] = RAM3HH[ADR_RD];
            DATOUT3[23:16] = RAM3HL[ADR_RD];
            DATOUT3[15:8] = RAM3LH[ADR_RD];
            DATOUT3[7:0] = RAM3LL[ADR_RD];
        end

        DATOUT4 = 32'h00000000;
        if (CERAM[4]) begin
            DATOUT4[31:24] = RAM4HH[ADR_RD];
            DATOUT4[23:16] = RAM4HL[ADR_RD];
            DATOUT4[15:8] = RAM4LH[ADR_RD];
            DATOUT4[7:0] = RAM4LL[ADR_RD];
        end

        DATOUT5 = 32'h00000000;
        if (CERAM[5]) begin
            DATOUT5[31:24] = RAM5HH[ADR_RD];
            DATOUT5[23:16] = RAM5HL[ADR_RD];
            DATOUT5[15:8] = RAM5LH[ADR_RD];
            DATOUT5[7:0] = RAM5LL[ADR_RD];
        end

        DATOUT6 = 32'h00000000;
        if (CERAM[6]) begin
            DATOUT6[31:24] = RAM6HH[ADR_RD];
            DATOUT6[23:16] = RAM6HL[ADR_RD];
            DATOUT6[15:8] = RAM6LH[ADR_RD];
            DATOUT6[7:0] = RAM6LL[ADR_RD];
        end

        DATOUT7 = 32'h00000000;
        if (CERAM[7]) begin
            DATOUT7[31:24] = RAM7HH[ADR_RD];
            DATOUT7[23:16] = RAM7HL[ADR_RD];
            DATOUT7[15:8] = RAM7LH[ADR_RD];
            DATOUT7[7:0] = RAM7LL[ADR_RD];
        end
    end

    assign DATO = DATOUT0 | DATOUT1 | DATOUT2 | DATOUT3 | DATOUT4 | DATOUT5 | DATOUT6 | DATOUT7;

endmodule