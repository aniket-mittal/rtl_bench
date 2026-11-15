// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07274 dut (
    .data_in(in_vec[63:32]),
    .dest_in(in_vec[31:0]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'ha8d3c218cbc534fb;
    stim[1] = 64'h25f8a9f43d0b2632;
    stim[2] = 64'hc7db5627a3283634;
    stim[3] = 64'h9162668df37e7923;
    stim[4] = 64'h260d8b8705166c7f;
    stim[5] = 64'hf33114af6e4e3505;
    stim[6] = 64'h80cbc1bb9d499c70;
    stim[7] = 64'h65ac896ce98170f8;
    stim[8] = 64'h8cd3b015ab6b9250;
    stim[9] = 64'h84300794918e305b;
    stim[10] = 64'h90903876e2e21932;
    stim[11] = 64'h83feff04e59825bb;
    stim[12] = 64'h8c1065aa752d43ab;
    stim[13] = 64'h65967c138181a47d;
    stim[14] = 64'h1b68ec3587f1e79f;
    stim[15] = 64'hf49cf76490c2b39d;
    stim[16] = 64'h01d2e5d0d0fa31cf;
    stim[17] = 64'h6699f1a25ea3e051;
    stim[18] = 64'hc4c6adce2d13afa1;
    stim[19] = 64'ha3f050cddcaa43d7;
    stim[20] = 64'hcca42316f47f8bba;
    stim[21] = 64'h92aaab43491a1ee6;
    stim[22] = 64'he781e42fdfe12099;
    stim[23] = 64'h55fb5f8c17a7adfa;
    stim[24] = 64'hff19a715e840054d;
    stim[25] = 64'h920ef49cc299f5db;
    stim[26] = 64'h52d72e4d455639a2;
    stim[27] = 64'h2356ba10179939db;
    stim[28] = 64'h6b2af69758bc2105;
    stim[29] = 64'hec98472da74d8e36;
    stim[30] = 64'hbddc5ca71606630d;
    stim[31] = 64'ha7bb8375e1f3f97d;
    stim[32] = 64'h30ee486187c40186;
    stim[33] = 64'h757b818d1bbabfa5;
    stim[34] = 64'h0921f6cddf65afe8;
    stim[35] = 64'h57f398e5bfb2049e;
    stim[36] = 64'he6abf03fb272e667;
    stim[37] = 64'h974ec77a3f8429f2;
    stim[38] = 64'he834ac2abfa72a90;
    stim[39] = 64'h11f15598f42ec283;
    stim[40] = 64'hfd394ae1e5468ee7;
    stim[41] = 64'h61411ff521348864;
    stim[42] = 64'h661fcb317cc3c978;
    stim[43] = 64'h05e8eaa89513d0a4;
    stim[44] = 64'hba80d8dbe9f7dd25;
    stim[45] = 64'h07c5870a280c074d;
    stim[46] = 64'hd1288eeb40e5e0ec;
    stim[47] = 64'hdc3b63887c67a344;
    stim[48] = 64'ha7ca4fa41bc2e604;
    stim[49] = 64'h344f457c6759e44c;
    stim[50] = 64'h82c7287311fcfc8b;
    stim[51] = 64'hb1b4a85528273ed1;
    stim[52] = 64'h8437a60cefc1fcef;
    stim[53] = 64'h232ff52c171ccf5a;
    stim[54] = 64'ha48a3038ffc57f19;
    stim[55] = 64'h5a685aa3c2ddacb5;
    stim[56] = 64'h75800938bc7757f1;
    stim[57] = 64'he76a45c95f098b62;
    stim[58] = 64'hf9a762943397ef3e;
    stim[59] = 64'h92a3104acbfd9761;
    stim[60] = 64'h3a2a6c0b05af411b;
    stim[61] = 64'h928fc7c299a69753;
    stim[62] = 64'hfaf922fe36242712;
    stim[63] = 64'hf7bf217018504800;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'ha8d3c218;
      expv[1] = 32'h25f8a9f4;
      expv[2] = 32'hc7db5627;
      expv[3] = 32'h9162668d;
      expv[4] = 32'h260d8b87;
      expv[5] = 32'hf33114af;
      expv[6] = 32'h80cbc1bb;
      expv[7] = 32'h65ac896c;
      expv[8] = 32'h8cd3b015;
      expv[9] = 32'h84300794;
      expv[10] = 32'h90903876;
      expv[11] = 32'h83feff04;
      expv[12] = 32'h8c1065aa;
      expv[13] = 32'h65967c13;
      expv[14] = 32'h1b68ec35;
      expv[15] = 32'hf49cf764;
      expv[16] = 32'h01d2e5d0;
      expv[17] = 32'h6699f1a2;
      expv[18] = 32'hc4c6adce;
      expv[19] = 32'ha3f050cd;
      expv[20] = 32'hcca42316;
      expv[21] = 32'h92aaab43;
      expv[22] = 32'he781e42f;
      expv[23] = 32'h55fb5f8c;
      expv[24] = 32'hff19a715;
      expv[25] = 32'h920ef49c;
      expv[26] = 32'h52d72e4d;
      expv[27] = 32'h2356ba10;
      expv[28] = 32'h6b2af697;
      expv[29] = 32'hec98472d;
      expv[30] = 32'hbddc5ca7;
      expv[31] = 32'ha7bb8375;
      expv[32] = 32'h30ee4861;
      expv[33] = 32'h757b818d;
      expv[34] = 32'h0921f6cd;
      expv[35] = 32'h57f398e5;
      expv[36] = 32'he6abf03f;
      expv[37] = 32'h974ec77a;
      expv[38] = 32'he834ac2a;
      expv[39] = 32'h11f15598;
      expv[40] = 32'hfd394ae1;
      expv[41] = 32'h61411ff5;
      expv[42] = 32'h661fcb31;
      expv[43] = 32'h05e8eaa8;
      expv[44] = 32'hba80d8db;
      expv[45] = 32'h07c5870a;
      expv[46] = 32'hd1288eeb;
      expv[47] = 32'hdc3b6388;
      expv[48] = 32'ha7ca4fa4;
      expv[49] = 32'h344f457c;
      expv[50] = 32'h82c72873;
      expv[51] = 32'hb1b4a855;
      expv[52] = 32'h8437a60c;
      expv[53] = 32'h232ff52c;
      expv[54] = 32'ha48a3038;
      expv[55] = 32'h5a685aa3;
      expv[56] = 32'h75800938;
      expv[57] = 32'he76a45c9;
      expv[58] = 32'hf9a76294;
      expv[59] = 32'h92a3104a;
      expv[60] = 32'h3a2a6c0b;
      expv[61] = 32'h928fc7c2;
      expv[62] = 32'hfaf922fe;
      expv[63] = 32'hf7bf2170;
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
