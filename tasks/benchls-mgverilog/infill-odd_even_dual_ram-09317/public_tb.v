// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 47;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09317 dut (
    .CLK(clk),
    .ED(in_vec[46:46]),
    .WE(in_vec[45:45]),
    .ODD(in_vec[44:44]),
    .ADDRW(in_vec[43:38]),
    .ADDRR(in_vec[37:32]),
    .DR(in_vec[31:16]),
    .DI(in_vec[15:0]),
    .DOR(out_vec[31:16]),
    .DOI(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 47'h041641186508;
    stim[1] = 47'h421b6ae62cdb;
    stim[2] = 47'h5b2689e75a4c;
    stim[3] = 47'h61915415bef6;
    stim[4] = 47'h775b3e53c3d9;
    stim[5] = 47'h052a57025e1f;
    stim[6] = 47'h2dcfe049f270;
    stim[7] = 47'h1f0a662d2655;
    stim[8] = 47'h0c11b4997bf8;
    stim[9] = 47'h612c22e9d73e;
    stim[10] = 47'h740f0b4d49d9;
    stim[11] = 47'h15214f146b1d;
    stim[12] = 47'h4a01123463e2;
    stim[13] = 47'h023c2542cdbd;
    stim[14] = 47'h6c7d43f23848;
    stim[15] = 47'h6864cfbda586;
    stim[16] = 47'h6d3cf33681b1;
    stim[17] = 47'h6b92911a0b72;
    stim[18] = 47'h0298ab116959;
    stim[19] = 47'h2ff0428206e2;
    stim[20] = 47'h16617498f4ba;
    stim[21] = 47'h4c86428745da;
    stim[22] = 47'h61e24d095cf0;
    stim[23] = 47'h77319d436388;
    stim[24] = 47'h1670448567fe;
    stim[25] = 47'h423dc4ee01de;
    stim[26] = 47'h7fab20c66fde;
    stim[27] = 47'h6ac292cce8cf;
    stim[28] = 47'h7195aaf564af;
    stim[29] = 47'h20cce852443b;
    stim[30] = 47'h332673e5ddc0;
    stim[31] = 47'h0d63b2a68816;
    stim[32] = 47'h347829d5f194;
    stim[33] = 47'h0aeba8ce5161;
    stim[34] = 47'h1c8d8c07d644;
    stim[35] = 47'h491dd8a1d723;
    stim[36] = 47'h0bfb9a5cb1cd;
    stim[37] = 47'h337bc3f04a4b;
    stim[38] = 47'h26adf3ffed8a;
    stim[39] = 47'h4f9ab36a9e0b;
    stim[40] = 47'h49fb57f90462;
    stim[41] = 47'h63ea5052149d;
    stim[42] = 47'h7464171bdbba;
    stim[43] = 47'h2c981b313606;
    stim[44] = 47'h447829fc6175;
    stim[45] = 47'h1fe4fb2898c4;
    stim[46] = 47'h0a3dd415dd24;
    stim[47] = 47'h0a6076670747;
    stim[48] = 47'h63f420d170d1;
    stim[49] = 47'h6f2395b8170e;
    stim[50] = 47'h15de3af64bca;
    stim[51] = 47'h67e94cf53f46;
    stim[52] = 47'h6c5f93905e29;
    stim[53] = 47'h271401041586;
    stim[54] = 47'h5fb7ba5367ee;
    stim[55] = 47'h72be93dafc82;
    stim[56] = 47'h5aaf22a23094;
    stim[57] = 47'h57f1338c2a05;
    stim[58] = 47'h38511f49deea;
    stim[59] = 47'h5ac4333da4fc;
    stim[60] = 47'h071ad7aab707;
    stim[61] = 47'h184bd63aba8d;
    stim[62] = 47'h6238e9fda763;
    stim[63] = 47'h318747515114;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'hxxxxxxxx;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'hxxxxxxxx;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'hxxxxxxxx;
      expv[11] = 32'hxxxxxxxx;
      expv[12] = 32'hxxxxxxxx;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'hxxxxxxxx;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxxxxxx;
      expv[19] = 32'hxxxxxxxx;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'hxxxxxxxx;
      expv[22] = 32'hxxxxxxxx;
      expv[23] = 32'hxxxxxxxx;
      expv[24] = 32'h43f23848;
      expv[25] = 32'h43f23848;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'hxxxxxxxx;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'hxxxxxxxx;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'hxxxxxxxx;
      expv[33] = 32'hxxxxxxxx;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'h3e53c3d9;
      expv[37] = 32'h3e53c3d9;
      expv[38] = 32'h3e53c3d9;
      expv[39] = 32'h3e53c3d9;
      expv[40] = 32'hxxxxxxxx;
      expv[41] = 32'hxxxxxxxx;
      expv[42] = 32'hxxxxxxxx;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'hxxxxxxxx;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'hxxxxxxxx;
      expv[50] = 32'hxxxxxxxx;
      expv[51] = 32'hxxxxxxxx;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'h93905e29;
      expv[59] = 32'h93905e29;
      expv[60] = 32'h22e9d73e;
      expv[61] = 32'h22e9d73e;
      expv[62] = 32'h22e9d73e;
      expv[63] = 32'hxxxxxxxx;
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
