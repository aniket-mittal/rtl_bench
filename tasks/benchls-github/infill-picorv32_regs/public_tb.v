// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  picorv32_regs dut (
    .clk(clk),
    .wen(in_vec[50:50]),
    .waddr(in_vec[49:44]),
    .raddr1(in_vec[43:38]),
    .raddr2(in_vec[37:32]),
    .wdata(in_vec[31:0]),
    .rdata1(out_vec[63:32]),
    .rdata2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h56c33dcc58de0;
    stim[1] = 51'h57dbecdd89aff;
    stim[2] = 51'h56c17a1decfc6;
    stim[3] = 51'h27850b98c471d;
    stim[4] = 51'h4996350988144;
    stim[5] = 51'h52dcb35348918;
    stim[6] = 51'h63d576695d663;
    stim[7] = 51'h522c7a3e7a252;
    stim[8] = 51'h3e4f72e38c842;
    stim[9] = 51'h7c6f5a754134a;
    stim[10] = 51'h759371d22bb7d;
    stim[11] = 51'h563f32fd38930;
    stim[12] = 51'h332106524cc53;
    stim[13] = 51'h02bb244719be9;
    stim[14] = 51'h5a271451a5ccf;
    stim[15] = 51'h3e4b2551cfaad;
    stim[16] = 51'h6c4c573b38965;
    stim[17] = 51'h39af1df25686b;
    stim[18] = 51'h3ce91311dfd6b;
    stim[19] = 51'h409e926b4a058;
    stim[20] = 51'h1d8a294c6d65f;
    stim[21] = 51'h54eee0bf2be6d;
    stim[22] = 51'h52d1be4154666;
    stim[23] = 51'h67fbc3b8fba5c;
    stim[24] = 51'h677abb74a55f5;
    stim[25] = 51'h18440775299e6;
    stim[26] = 51'h27a9f8e77b0d8;
    stim[27] = 51'h4a1be70f0870d;
    stim[28] = 51'h4994a65eacc23;
    stim[29] = 51'h53231d75ecd8d;
    stim[30] = 51'h5cf55b25e1eb4;
    stim[31] = 51'h697b38b71f0d3;
    stim[32] = 51'h3efbdce8ee1b4;
    stim[33] = 51'h7867c55bab28f;
    stim[34] = 51'h6507fe3f5b94e;
    stim[35] = 51'h677fcb498eb1f;
    stim[36] = 51'h37fb447c43c46;
    stim[37] = 51'h4b0adff928583;
    stim[38] = 51'h19b2e62300103;
    stim[39] = 51'h56cb0ab286215;
    stim[40] = 51'h6c7bdd17af0df;
    stim[41] = 51'h72faadfb11239;
    stim[42] = 51'h4a6032a1dac02;
    stim[43] = 51'h256a0a6864329;
    stim[44] = 51'h4cd54b372b75b;
    stim[45] = 51'h196e38809a0f6;
    stim[46] = 51'h443be7498b195;
    stim[47] = 51'h7cd65fe246b50;
    stim[48] = 51'h06470104e95dd;
    stim[49] = 51'h11c14c18e56e9;
    stim[50] = 51'h2e28ab69b3ef5;
    stim[51] = 51'h16840978e06b2;
    stim[52] = 51'h4c38e81672439;
    stim[53] = 51'h402c7d15e3feb;
    stim[54] = 51'h1e458f2874841;
    stim[55] = 51'h66e8d52941919;
    stim[56] = 51'h3924d392a586b;
    stim[57] = 51'h16a71a1c519d4;
    stim[58] = 51'h0ede741aa20a1;
    stim[59] = 51'h219ef700afbb1;
    stim[60] = 51'h48284835f79be;
    stim[61] = 51'h5fec146757374;
    stim[62] = 51'h7a620f69d26c3;
    stim[63] = 51'h0ac68766d9987;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hdcc58de0xxxxxxxx;
      expv[2] = 64'hxxxxxxxxcdd89aff;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hcdd89affxxxxxxxx;
      expv[6] = 64'hxxxxxxxxcdd89aff;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxcdd89aff;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxcdd89aff;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxa3e7a252;
      expv[14] = 64'h50988144xxxxxxxx;
      expv[15] = 64'ha3e7a252a3e7a252;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'h451a5ccfxxxxxxxx;
      expv[19] = 64'hxxxxxxxx50988144;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'h0bf2be6dxxxxxxxx;
      expv[23] = 64'hxxxxxxxxa754134a;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxx70f0870d;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxx1d22bb7d;
      expv[31] = 64'hxxxxxxxxd75ecd8d;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxb25e1eb4;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxb25e1eb4;
      expv[36] = 64'hxxxxxxxx0bf2be6d;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'h73b38965xxxxxxxx;
      expv[39] = 64'he4154666xxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxx70f0870d;
      expv[42] = 64'h55bab28f6695d663;
      expv[43] = 64'h451a5ccfxxxxxxxx;
      expv[44] = 64'h1d22bb7d0bf2be6d;
      expv[45] = 64'hxxxxxxxx6695d663;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'h1d22bb7de3f5b94e;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxx0bf2be6d;
      expv[50] = 64'h2a1dac022a1dac02;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hff928583b498eb1f;
      expv[54] = 64'hxxxxxxxx55bab28f;
      expv[55] = 64'h451a5ccfxxxxxxxx;
      expv[56] = 64'h8b71f0d3xxxxxxxx;
      expv[57] = 64'h8b71f0d3xxxxxxxx;
      expv[58] = 64'hcdd89affb498eb1f;
      expv[59] = 64'hb498eb1fxxxxxxxx;
      expv[60] = 64'h2a1dac027498b195;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'h55bab28fxxxxxxxx;
      expv[63] = 64'hxxxxxxxx835f79be;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
