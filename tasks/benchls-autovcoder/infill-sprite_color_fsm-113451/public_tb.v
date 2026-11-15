// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_113451 dut (
    .clock_25(clk),
    .v0(in_vec[110:95]),
    .v1(in_vec[94:79]),
    .v2(in_vec[78:63]),
    .v3(in_vec[62:47]),
    .sp0(in_vec[46:42]),
    .sp1(in_vec[41:37]),
    .sp2(in_vec[36:32]),
    .sp3(in_vec[31:27]),
    .clock_maior(in_vec[26:26]),
    .rst(in_vec[25:25]),
    .att_color(in_vec[24:24]),
    .data_color(in_vec[23:0]),
    .blue(out_vec[24:17]),
    .green(out_vec[16:9]),
    .red(out_vec[8:1]),
    .branco(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h5b8c8e268e1364c5dde8eb457335;
    stim[1] = 111'h0ce24815004536f3a7db57f098e9;
    stim[2] = 111'h1a0a76c012a9f117a0d434a75f94;
    stim[3] = 111'h184392255d46be1ba4f869d75581;
    stim[4] = 111'h12f6fcdd457d7be7701864c3d57f;
    stim[5] = 111'h56655c65ba13bb8ccb97fcaf2343;
    stim[6] = 111'h3681adb0a0c4436c5a8ff5a1585d;
    stim[7] = 111'h333d93d23bc78a168d18488e7e39;
    stim[8] = 111'h154b1c4e4f18a026fc1444c5d24c;
    stim[9] = 111'h29aad47e078c79d8990a48488a3c;
    stim[10] = 111'h78c4e3faabfb25e3b190f91cbe9f;
    stim[11] = 111'h7cf3b0ad484b20e54970e10e24c9;
    stim[12] = 111'h2bfd9b1970f23ef83036502dc9d1;
    stim[13] = 111'h156fef620bb8400565c870412219;
    stim[14] = 111'h05d3dc88cb4c5dfa31152be26ef4;
    stim[15] = 111'h42ade2ec31eb873c2d28f071afbe;
    stim[16] = 111'h6cfee753fb12ae9be7052dabf461;
    stim[17] = 111'h67df499b601168cdf35eedf559ea;
    stim[18] = 111'h792582bd88cce54a4024e5038799;
    stim[19] = 111'h3ca551389e9fdf1404a95967b337;
    stim[20] = 111'h7b236471622c962a53e10540e272;
    stim[21] = 111'h7b0a45fd35c89f576f32c02cabfe;
    stim[22] = 111'h1060f03e34173fe36e051c4c5096;
    stim[23] = 111'h003d03bd4020c33d810e0955fef2;
    stim[24] = 111'h640f43973a650a21676dad1b9d34;
    stim[25] = 111'h512c1c8fd60d3b3ac2255dc1fc91;
    stim[26] = 111'h35d7d227fbdfede77b3069a5cb24;
    stim[27] = 111'h667834c693b315425d1949250529;
    stim[28] = 111'h620215a4afdc017ee1c1a02212da;
    stim[29] = 111'h56fcbf5a4a37e3d2a1f1508d7734;
    stim[30] = 111'h4dae723f657a31a88787d1ecf729;
    stim[31] = 111'h59ba08ff0c18049ca979b4381338;
    stim[32] = 111'h6f0cda1f42cc0a72cf92d011e965;
    stim[33] = 111'h32025b94d9c74b469dc8e54f4515;
    stim[34] = 111'h039386342cbd9877c4962c50542a;
    stim[35] = 111'h22281982a548d8f659b84d075534;
    stim[36] = 111'h7f098b91d24fb5f159b7f9f4498e;
    stim[37] = 111'h261d74b22ecaae55a9835ce04c0d;
    stim[38] = 111'h294754bb387f9322333fbd65156e;
    stim[39] = 111'h1f87e25ba339d84ab6500d66c809;
    stim[40] = 111'h11407928b6b68059db93cc98c754;
    stim[41] = 111'h67e59dc0b9ed58af72b0b5dca3a5;
    stim[42] = 111'h698c75486b1339dcab2cd5a96689;
    stim[43] = 111'h1114b1035796825a4a026d5f5d90;
    stim[44] = 111'h22d80affe7600dde6ad1ec3120ea;
    stim[45] = 111'h584e8b7b1928a34fd58e7c5b0ddd;
    stim[46] = 111'h6bdcec33b5529740002dd5e5cd18;
    stim[47] = 111'h4876f1f124523b37212259f273b6;
    stim[48] = 111'h30ca4d4338b0ba797d3598f43b19;
    stim[49] = 111'h1fa0a01743482272e8ff5162c7ec;
    stim[50] = 111'h78c597679c488b32a0869c968a39;
    stim[51] = 111'h04d6ecea1292d7a948c5201b4010;
    stim[52] = 111'h5486ae5c8d1c36c0998ba460547b;
    stim[53] = 111'h09ef671617de389d3ae6655652a1;
    stim[54] = 111'h2bbd32989935555036069cdb5e28;
    stim[55] = 111'h424553f6ec50022e15b090963279;
    stim[56] = 111'h16ad0ad9da25b27d914b7c4129fa;
    stim[57] = 111'h31854689103834d7a9edf8dc060b;
    stim[58] = 111'h62a21b6d44e2cd7f67fb1597e404;
    stim[59] = 111'h682a654c514721c658fcbcf0f19a;
    stim[60] = 111'h089c30cc21069741ecdf0c8f3de0;
    stim[61] = 111'h1d594b6b8138413e5a7734708803;
    stim[62] = 111'h42242e852f11abbb9665ccb38938;
    stim[63] = 111'h6457eae7e067eff18df63de1f491;
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
      expv[0] = 25'h0000001;
      expv[1] = 25'h0000001;
      expv[2] = 25'h0000001;
      expv[3] = 25'h0000001;
      expv[4] = 25'h0000001;
      expv[5] = 25'h0000001;
      expv[6] = 25'h0000001;
      expv[7] = 25'h0000001;
      expv[8] = 25'h0000001;
      expv[9] = 25'h0000001;
      expv[10] = 25'h0000001;
      expv[11] = 25'h0000001;
      expv[12] = 25'h0000001;
      expv[13] = 25'h0000001;
      expv[14] = 25'h0000001;
      expv[15] = 25'h0000001;
      expv[16] = 25'h0000001;
      expv[17] = 25'h0000001;
      expv[18] = 25'h0000001;
      expv[19] = 25'h0000001;
      expv[20] = 25'h0000001;
      expv[21] = 25'h0000001;
      expv[22] = 25'h0000001;
      expv[23] = 25'h0000001;
      expv[24] = 25'h0000001;
      expv[25] = 25'h0000001;
      expv[26] = 25'h0000001;
      expv[27] = 25'h0000001;
      expv[28] = 25'h0000001;
      expv[29] = 25'h0000001;
      expv[30] = 25'h0000001;
      expv[31] = 25'h0000001;
      expv[32] = 25'h0000001;
      expv[33] = 25'h0000001;
      expv[34] = 25'h0000001;
      expv[35] = 25'h0000001;
      expv[36] = 25'h0000001;
      expv[37] = 25'h0000001;
      expv[38] = 25'h0000001;
      expv[39] = 25'h0000001;
      expv[40] = 25'h0000001;
      expv[41] = 25'h0000001;
      expv[42] = 25'h0000001;
      expv[43] = 25'h0000001;
      expv[44] = 25'h0000001;
      expv[45] = 25'h0000001;
      expv[46] = 25'h0000001;
      expv[47] = 25'h0000001;
      expv[48] = 25'h0000001;
      expv[49] = 25'h0000001;
      expv[50] = 25'h0000001;
      expv[51] = 25'h0000001;
      expv[52] = 25'h0000001;
      expv[53] = 25'h0000001;
      expv[54] = 25'h0000001;
      expv[55] = 25'h0000001;
      expv[56] = 25'h0000001;
      expv[57] = 25'h0000001;
      expv[58] = 25'h0000001;
      expv[59] = 25'h0000001;
      expv[60] = 25'h0000001;
      expv[61] = 25'h0000001;
      expv[62] = 25'h0000001;
      expv[63] = 25'h0000001;
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
