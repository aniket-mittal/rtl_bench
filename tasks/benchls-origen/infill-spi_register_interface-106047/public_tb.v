// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 91;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106047 dut (
    .clk(clk),
    .rst_n(in_vec[67:67]),
    .cpu_if_address(in_vec[66:35]),
    .cpu_if_write_data(in_vec[34:3]),
    .cpu_if_read(in_vec[2:2]),
    .cpu_if_write(in_vec[1:1]),
    .access_complete(in_vec[0:0]),
    .cpu_if_read_data(out_vec[90:59]),
    .cpu_if_access_complete(out_vec[58:58]),
    .command(out_vec[57:50]),
    .read_not_write(out_vec[49:49]),
    .address(out_vec[48:17]),
    .address_bytes(out_vec[16:15]),
    .address_valid(out_vec[14:14]),
    .dummy_cycles(out_vec[13:11]),
    .dummy_valid(out_vec[10:10]),
    .data_bytes(out_vec[9:2]),
    .data_valid(out_vec[1:1]),
    .access_request(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h0fa067beaede0a0f5;
    stim[1] = 68'h7d95c44a0061c5464;
    stim[2] = 68'hdeb0e8751cf86c790;
    stim[3] = 68'h9b54acf7644741af1;
    stim[4] = 68'hefdf8126d259ff5ec;
    stim[5] = 68'hd0d4e779488e27993;
    stim[6] = 68'hb7fa7b03813e9860f;
    stim[7] = 68'hef8898be2b6fabcdb;
    stim[8] = 68'hfc1b29ac4861830fa;
    stim[9] = 68'h9c215d21a5ba75d35;
    stim[10] = 68'h8f2ae64d40dae4e9b;
    stim[11] = 68'h2213d58843517a2f0;
    stim[12] = 68'hfef7a886530883db1;
    stim[13] = 68'he07d1a9c821c3e7aa;
    stim[14] = 68'hc8ca64b15f8c6084d;
    stim[15] = 68'hd21a3831bc5592733;
    stim[16] = 68'hdf4c89fc5252c5d8b;
    stim[17] = 68'h856d05583652c31ee;
    stim[18] = 68'hb7eb8c66c457ef380;
    stim[19] = 68'hc11c4cc74fe0c68ef;
    stim[20] = 68'ha6dad398aaf1e277b;
    stim[21] = 68'hea1cb0d5c7a755548;
    stim[22] = 68'he7812a29f01471c06;
    stim[23] = 68'hbdb96de3e35933ea4;
    stim[24] = 68'ha78ba836ee80ab982;
    stim[25] = 68'hb142d22b8ea5df078;
    stim[26] = 68'h9c0377f2985a8b268;
    stim[27] = 68'he291ec73440881afc;
    stim[28] = 68'hce8fabbe8d2bc8422;
    stim[29] = 68'hb54805b11dd22e8e5;
    stim[30] = 68'ha29746c85ac521b98;
    stim[31] = 68'had66f9e3d0d69c27a;
    stim[32] = 68'ha8ab751791c58f281;
    stim[33] = 68'hce68ce6c4aa727275;
    stim[34] = 68'hf954fa6172bb689ea;
    stim[35] = 68'hc8e27a647d3d127ab;
    stim[36] = 68'h9b8758771544da10b;
    stim[37] = 68'hed50851913a0b17cd;
    stim[38] = 68'hec38a3dd8245f7567;
    stim[39] = 68'hac2b7ac2db935b5fd;
    stim[40] = 68'h9e472c616a4276951;
    stim[41] = 68'hfe4b05e2ab25e93ca;
    stim[42] = 68'h8a1c9cf1e89a670d5;
    stim[43] = 68'hd9ed8375505d4286d;
    stim[44] = 68'hd9448af4185a51297;
    stim[45] = 68'hcf74ff93c15da9b7a;
    stim[46] = 68'ha6fb5f837c82c59d3;
    stim[47] = 68'hc5cc69dc7e1bb3137;
    stim[48] = 68'hd24a6c9ab8681f948;
    stim[49] = 68'hd0d60c4cd48f42ccb;
    stim[50] = 68'h43a4bb8ad7ce80352;
    stim[51] = 68'ha3ea242a18a68f513;
    stim[52] = 68'h8534d656562d6a0a4;
    stim[53] = 68'hf09b682e68213a278;
    stim[54] = 68'h8850e663d7a1a4323;
    stim[55] = 68'hc26f18081ba9e7a24;
    stim[56] = 68'h98aabca85e71540f6;
    stim[57] = 68'hca3527a155864bad4;
    stim[58] = 68'h99ba202206ab9e94d;
    stim[59] = 68'hfb91108efd93c83b2;
    stim[60] = 68'hf401fa6b3e89d8aee;
    stim[61] = 68'he8c8e3ec86ae34612;
    stim[62] = 68'h9fc44b364e283fb9c;
    stim[63] = 68'hf76fad612d9ce5339;
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
      expv[0] = 91'hxxxxxxxxx00000000000000;
      expv[1] = 91'h00000000000000000000000;
      expv[2] = 91'h00000000000000000000000;
      expv[3] = 91'h00000000000000000000000;
      expv[4] = 91'h00000000000000000000000;
      expv[5] = 91'h00000000400000000000000;
      expv[6] = 91'h000000004000000000000ca;
      expv[7] = 91'h0000000040004fa618200ca;
      expv[8] = 91'h0000000040004fa618200ca;
      expv[9] = 91'h0000000040004fa618200ca;
      expv[10] = 91'h0000000040004fa618200ca;
      expv[11] = 91'h00000000000000000000000;
      expv[12] = 91'h00000000000000000000000;
      expv[13] = 91'h00000000000000000000000;
      expv[14] = 91'h00000000400000000000000;
      expv[15] = 91'h00000000400000000000000;
      expv[16] = 91'h00000000798000000000001;
      expv[17] = 91'h00000000798000000000001;
      expv[18] = 91'h000000007980000000000f5;
      expv[19] = 91'h000000003980000000000f4;
      expv[20] = 91'h00000000798000000002cf4;
      expv[21] = 91'h00000000798000000002fbc;
      expv[22] = 91'h00000000398000000002fbc;
      expv[23] = 91'h2af1e277f98000000002e02;
      expv[24] = 91'h00000000798000000002e02;
      expv[25] = 91'h00000000798000000000202;
      expv[26] = 91'h00000000398000000000202;
      expv[27] = 91'h00000000398000000000202;
      expv[28] = 91'h00000000798000000000202;
      expv[29] = 91'h00000000798000000000202;
      expv[30] = 91'h3c559273798000000000202;
      expv[31] = 91'h3c559273398000000000202;
      expv[32] = 91'h3c559273799435a709e0202;
      expv[33] = 91'h3c559273399435a709e0202;
      expv[34] = 91'h00000000799435a709e0202;
      expv[35] = 91'h000000004f7435a709e0203;
      expv[36] = 91'h000000004f7435a709ec203;
      expv[37] = 91'h000000004f7435a709eca03;
      expv[38] = 91'h701471c04f7435a709eca02;
      expv[39] = 91'h000000004f7435a709eca02;
      expv[40] = 91'h50d69c27cf7435a709eca02;
      expv[41] = 91'h50d69c278f7435a709eca02;
      expv[42] = 91'h50d69c27cf6ac97a4f2ca02;
      expv[43] = 91'h72bb689ecf6ac97a4f2ca02;
      expv[44] = 91'h7d3d127acf6ac97a4f2ca02;
      expv[45] = 91'h7d3d127acf6ac97a4f30a02;
      expv[46] = 91'h7d3d127acf70576a6df0a02;
      expv[47] = 91'h7d3d127acf7f20b16750a02;
      expv[48] = 91'h000000004f7f20b16750a02;
      expv[49] = 91'h000000000f7f20b16750a02;
      expv[50] = 91'h00000000000000000000000;
      expv[51] = 91'h00000000000000000000000;
      expv[52] = 91'h00000000400000000000000;
      expv[53] = 91'h00000000400000000000000;
      expv[54] = 91'h00000000000000000000000;
      expv[55] = 91'h000000004015e8690c80000;
      expv[56] = 91'h000000004015e8690c80000;
      expv[57] = 91'h000000004015e8690c80078;
      expv[58] = 91'h000000004015e8690c80078;
      expv[59] = 91'h57a1a4324015e8690c80078;
      expv[60] = 91'h57a1a4324015e8690c80078;
      expv[61] = 91'h000000004015e8690c80078;
      expv[62] = 91'h000000004015e8690c80078;
      expv[63] = 91'h000000004015e8690c80078;
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
