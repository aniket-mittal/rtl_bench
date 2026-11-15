// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_030179 dut (
    .A(in_vec[67:36]),
    .B(in_vec[35:4]),
    .ALUop(in_vec[3:0]),
    .Result(out_vec[34:3]),
    .Overflow(out_vec[2:2]),
    .CarryOut(out_vec[1:1]),
    .Zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h94c0f6050f6250d5f;
    stim[1] = 68'hc8ae89eaaf975cf52;
    stim[2] = 68'h940c85b00b3486b9f;
    stim[3] = 68'hfc8f93d1a57a23e80;
    stim[4] = 68'h38e89ba136b9749c1;
    stim[5] = 68'h203545fe279a90ec1;
    stim[6] = 68'h08d92a324950d278e;
    stim[7] = 68'h0ac986354dc7f7a60;
    stim[8] = 68'hef66ca96b154ac2b8;
    stim[9] = 68'hc1c5b90af0f9978b4;
    stim[10] = 68'h0a4f46e0761face9b;
    stim[11] = 68'h04bd692310ba158cc;
    stim[12] = 68'h6db57b8e786386970;
    stim[13] = 68'hc95473c4c427d330d;
    stim[14] = 68'h41c886005cbea9cfd;
    stim[15] = 68'hbd428bdc7a0d968c3;
    stim[16] = 68'h3425ebdbb038569d8;
    stim[17] = 68'hdcc55f55a0ccfeb1c;
    stim[18] = 68'h67cc26119a0740fc6;
    stim[19] = 68'h547f147d95eeee93e;
    stim[20] = 68'he8c2f588ba93e1f1c;
    stim[21] = 68'hd6dc7cd946a045cbb;
    stim[22] = 68'hc614394b68a26fb4e;
    stim[23] = 68'ha8042420c4ea08250;
    stim[24] = 68'h671bbaf587c936f51;
    stim[25] = 68'h821b22530352d77bf;
    stim[26] = 68'hbad778f4b913af04e;
    stim[27] = 68'hc8e8ef11b9ff50fbb;
    stim[28] = 68'h98efcfd9d524f29e1;
    stim[29] = 68'hf718850700bf64b43;
    stim[30] = 68'h64b4ef838506fbb26;
    stim[31] = 68'h23abc45422aacf6df;
    stim[32] = 68'hd8ea7fd336e09434e;
    stim[33] = 68'hc7eaa454196d2e569;
    stim[34] = 68'hde97c7e8a3f128e3d;
    stim[35] = 68'h87da336054fc1347a;
    stim[36] = 68'h4b45a9e5a6b20a0ef;
    stim[37] = 68'h111a19e531caa7100;
    stim[38] = 68'hcaf9b01db49e96773;
    stim[39] = 68'h239cdad36f2c28e28;
    stim[40] = 68'ha231a1c26d8a2f1d0;
    stim[41] = 68'h17dd742e727199ddd;
    stim[42] = 68'hed57b156a4726cbca;
    stim[43] = 68'h25788251c44be3685;
    stim[44] = 68'hb5dbcaee54fc077b7;
    stim[45] = 68'hda5bcfd24b3496172;
    stim[46] = 68'h01603c35b5b5929f7;
    stim[47] = 68'hab3c36a73a50e1845;
    stim[48] = 68'h97f739f0878723c05;
    stim[49] = 68'ha1cf8ce838f67e86e;
    stim[50] = 68'h89f132c18b28aad9d;
    stim[51] = 68'hda11f4da2a385d37f;
    stim[52] = 68'h9dcfce2b59a67e69f;
    stim[53] = 68'hdbb21a8a54bc67706;
    stim[54] = 68'h2ffe6d3c972dc3df0;
    stim[55] = 68'h3c4425c7affcaac4d;
    stim[56] = 68'h8cdc9bbff480a45f3;
    stim[57] = 68'haefef8db402ece206;
    stim[58] = 68'h1bca237e73f5eee1e;
    stim[59] = 68'hd57a7fd43928762e9;
    stim[60] = 68'h01e7ec9b49a345003;
    stim[61] = 68'h4cdba9dc252b17747;
    stim[62] = 68'h76350148b9f36dda7;
    stim[63] = 68'h50273910c0f138866;
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
      expv[0] = 35'h000000001;
      expv[1] = 35'h3c22f36fe;
      expv[2] = 35'h000000001;
      expv[3] = 35'h520501e00;
      expv[4] = 35'h1f7cffde8;
      expv[5] = 35'h13dfeaff0;
      expv[6] = 35'h000000001;
      expv[7] = 35'h0460c3120;
      expv[8] = 35'h2f19335e8;
      expv[9] = 35'h7ffe1f328;
      expv[10] = 35'h000000001;
      expv[11] = 35'h000000001;
      expv[12] = 35'h341081430;
      expv[13] = 35'h000000001;
      expv[14] = 35'h000000001;
      expv[15] = 35'h600000000;
      expv[16] = 35'h420edea30;
      expv[17] = 35'h000000001;
      expv[18] = 35'h66e2728ac;
      expv[19] = 35'h000000001;
      expv[20] = 35'h000000001;
      expv[21] = 35'h000000001;
      expv[22] = 35'h000000001;
      expv[23] = 35'h400000100;
      expv[24] = 35'h73eddf7a8;
      expv[25] = 35'h000000001;
      expv[26] = 35'h000000001;
      expv[27] = 35'h000000001;
      expv[28] = 35'h6ef7ffef8;
      expv[29] = 35'h2fd92d000;
      expv[30] = 35'h6fd6f9e8c;
      expv[31] = 35'h000000001;
      expv[32] = 35'h000000001;
      expv[33] = 35'h000000001;
      expv[34] = 35'h000000001;
      expv[35] = 35'h000000001;
      expv[36] = 35'h000000001;
      expv[37] = 35'h088500800;
      expv[38] = 35'h700000000;
      expv[39] = 35'h265879188;
      expv[40] = 35'h100010800;
      expv[41] = 35'h000000001;
      expv[42] = 35'h000000001;
      expv[43] = 35'h000031128;
      expv[44] = 35'h000000008;
      expv[45] = 35'h12c832f4a;
      expv[46] = 35'h000000001;
      expv[47] = 35'h003a50e18;
      expv[48] = 35'h000043c38;
      expv[49] = 35'h000000001;
      expv[50] = 35'h000000001;
      expv[51] = 35'h000000001;
      expv[52] = 35'h000000001;
      expv[53] = 35'h437ad98d2;
      expv[54] = 35'h0396208e0;
      expv[55] = 35'h000000001;
      expv[56] = 35'h400000000;
      expv[57] = 35'h3768155de;
      expv[58] = 35'h000000001;
      expv[59] = 35'h000000001;
      expv[60] = 35'h000000001;
      expv[61] = 35'h000000001;
      expv[62] = 35'h000000001;
      expv[63] = 35'h479b00454;
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
