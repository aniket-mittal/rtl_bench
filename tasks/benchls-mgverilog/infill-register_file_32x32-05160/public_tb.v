// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05160 dut (
    .clk(clk),
    .rst(in_vec[48:48]),
    .rd_addr_1(in_vec[47:43]),
    .rd_addr_2(in_vec[42:38]),
    .wr_addr(in_vec[37:33]),
    .wr_en(in_vec[32:32]),
    .wr_data(in_vec[31:0]),
    .rd_data_1(out_vec[63:32]),
    .rd_data_2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h1dd9e3e59b7b0;
    stim[1] = 49'h141ac325d36c8;
    stim[2] = 49'h013b78435df2d;
    stim[3] = 49'h0c6dc48115c06;
    stim[4] = 49'h0561462b501f1;
    stim[5] = 49'h0f170032bfa21;
    stim[6] = 49'h016ade67495a8;
    stim[7] = 49'h00c555ca6a863;
    stim[8] = 49'h07650b307002c;
    stim[9] = 49'h06ce33d41cbfc;
    stim[10] = 49'h0cceed9b3b9ec;
    stim[11] = 49'h07eb279874921;
    stim[12] = 49'h0dd7f95fdde4a;
    stim[13] = 49'h065674b923360;
    stim[14] = 49'h0459981a722f0;
    stim[15] = 49'h0f36b9f819a87;
    stim[16] = 49'h025643efa9fda;
    stim[17] = 49'h018fa8f6f2e13;
    stim[18] = 49'h09c682494bc61;
    stim[19] = 49'h0134f09655c58;
    stim[20] = 49'h0a2d766b11eef;
    stim[21] = 49'h078a4950a2444;
    stim[22] = 49'h0a1e3d40a5468;
    stim[23] = 49'h0a36edd77a0f0;
    stim[24] = 49'h0202d267a99b4;
    stim[25] = 49'h0f284abf81448;
    stim[26] = 49'h0efbe1effc8d0;
    stim[27] = 49'h0248d8ed1d165;
    stim[28] = 49'h0b094bc2c8aa4;
    stim[29] = 49'h0353f465d17ac;
    stim[30] = 49'h08394dced6b6b;
    stim[31] = 49'h0e3a62cd8e546;
    stim[32] = 49'h04e71ab90db50;
    stim[33] = 49'h0232e8f474474;
    stim[34] = 49'h007cca9b88da9;
    stim[35] = 49'h07445cd041d6d;
    stim[36] = 49'h08fe786136990;
    stim[37] = 49'h00749a4c50b8b;
    stim[38] = 49'h0ff5514126f8c;
    stim[39] = 49'h0746035f12b6f;
    stim[40] = 49'h0cfcd606a8a1c;
    stim[41] = 49'h060fb81194dc1;
    stim[42] = 49'h09ada4ad2785c;
    stim[43] = 49'h0a04fc17e8014;
    stim[44] = 49'h0ff383053f902;
    stim[45] = 49'h0cf104a64bc9e;
    stim[46] = 49'h0fd3dd4f95c34;
    stim[47] = 49'h02e62368a27bd;
    stim[48] = 49'h0286906152720;
    stim[49] = 49'h06ff56dd7c6f2;
    stim[50] = 49'h098ae4774b715;
    stim[51] = 49'h0e7fc2fb436a8;
    stim[52] = 49'h09e75256a9933;
    stim[53] = 49'h04e78b1f2c91d;
    stim[54] = 49'h0014ac678d0ac;
    stim[55] = 49'h0c0164d4b4b09;
    stim[56] = 49'h0c78b77a51532;
    stim[57] = 49'h0d152bc10c121;
    stim[58] = 49'h0aa2a670e3eba;
    stim[59] = 49'h092cd47d7912a;
    stim[60] = 49'h0bad2fc4a75c7;
    stim[61] = 49'h008b3696bf72e;
    stim[62] = 49'h0f8ab4e7d49c3;
    stim[63] = 49'h00ac19d1f853e;
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
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h000000008435df2d;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h8435df2d00000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h00000000e67495a8;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h000000009f819a87;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h4b9233603d41cbfc;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000009655c58;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h000000005ca6a863;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h267a99b400000000;
      expv[29] = 64'h8ed1d16500000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000081a722f0;
      expv[34] = 64'h00000000465d17ac;
      expv[35] = 64'h00000000d40a5468;
      expv[36] = 64'hd40a5468465d17ac;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h465d17ac00000000;
      expv[39] = 64'h00000000d40a5468;
      expv[40] = 64'h00000000465d17ac;
      expv[41] = 64'h81a722f000000000;
      expv[42] = 64'h8613699066b11eef;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h465d17ac00000000;
      expv[45] = 64'h0000000000000000;
      expv[46] = 64'h465d17ac00000000;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h0000000000000000;
      expv[49] = 64'h00000000465d17ac;
      expv[50] = 64'h86136990cd041d6d;
      expv[51] = 64'h00000000465d17ac;
      expv[52] = 64'h8613699000000000;
      expv[53] = 64'h0000000000000000;
      expv[54] = 64'h0000000000000000;
      expv[55] = 64'hab90db5000000000;
      expv[56] = 64'hab90db50d4f95c34;
      expv[57] = 64'h256a993377a51532;
      expv[58] = 64'h9f819a8700000000;
      expv[59] = 64'h0000000066b11eef;
      expv[60] = 64'h0000000066b11eef;
      expv[61] = 64'h00000000cd041d6d;
      expv[62] = 64'h465d17accd041d6d;
      expv[63] = 64'h0000000066b11eef;
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
