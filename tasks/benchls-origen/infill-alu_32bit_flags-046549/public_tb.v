// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046549 dut (
    .A(in_vec[66:35]),
    .B(in_vec[34:3]),
    .FSEL(in_vec[2:0]),
    .DOUT(out_vec[35:4]),
    .COUT(out_vec[3:3]),
    .ZERO(out_vec[2:2]),
    .NEG(out_vec[1:1]),
    .OVF(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h2ed9ad3126a5155f1;
    stim[1] = 67'h624e52d73dd1736c5;
    stim[2] = 67'h56ce53466be038724;
    stim[3] = 67'h0b0039b6fa326a178;
    stim[4] = 67'h7dc5985838fbffdcc;
    stim[5] = 67'h538eb10ca6e302dd2;
    stim[6] = 67'h4d7f3d78453c899a5;
    stim[7] = 67'h7ea8c38f5516ac25c;
    stim[8] = 67'h18de11a067ddd84ec;
    stim[9] = 67'h1efded5639b36ca2b;
    stim[10] = 67'h32f7df460a33c41e2;
    stim[11] = 67'h1f52991e97ad41d23;
    stim[12] = 67'h73f8d9315bcb4f647;
    stim[13] = 67'h4aa080d45d0d58692;
    stim[14] = 67'h7c68ce8082504e3d5;
    stim[15] = 67'h3a4866e178b9aef05;
    stim[16] = 67'h5cd5ae2a7fccf7c2c;
    stim[17] = 67'h10d7bfdeaba4c63c7;
    stim[18] = 67'h50f9501b544a00132;
    stim[19] = 67'h70dfd999a8ed5dae4;
    stim[20] = 67'h09f1acb97284680e5;
    stim[21] = 67'h6f8d9294ace6f3091;
    stim[22] = 67'h688abcecc47d7fc8c;
    stim[23] = 67'h1799a739f27437c5b;
    stim[24] = 67'h06d36441489bf3693;
    stim[25] = 67'h1391d209cf333cf17;
    stim[26] = 67'h790a79d34c62e280f;
    stim[27] = 67'h34e4c16d005577a4d;
    stim[28] = 67'h4b0d20e48d10ddcc3;
    stim[29] = 67'h3b8b41fe597631a0d;
    stim[30] = 67'h0edd376dc165a31fc;
    stim[31] = 67'h7766713c4a5c2c828;
    stim[32] = 67'h69639b7800d3acada;
    stim[33] = 67'h48638bfdebc635785;
    stim[34] = 67'h65b0565dc039f6664;
    stim[35] = 67'h3f0e380bd6c19f674;
    stim[36] = 67'h0c2da40000f90440f;
    stim[37] = 67'h3cb23986030ff853e;
    stim[38] = 67'h2b255dd47f46298ba;
    stim[39] = 67'h7322af8239c993b95;
    stim[40] = 67'h17bf7789bc4b47b64;
    stim[41] = 67'h57035c1e695d2a9fe;
    stim[42] = 67'h3a31f013486c38954;
    stim[43] = 67'h43a4a6fcbb172280f;
    stim[44] = 67'h608dfc1bbbdb576fc;
    stim[45] = 67'h698c9856231fe52e8;
    stim[46] = 67'h0507ec0ddfc6f80ef;
    stim[47] = 67'h7f9592f6c0ad79bf6;
    stim[48] = 67'h662da7f1699cbf27e;
    stim[49] = 67'h37ec51d60ff335da1;
    stim[50] = 67'h1e930dd589b70fa95;
    stim[51] = 67'h7ee4e69186f23d613;
    stim[52] = 67'h59b7436933bdbcceb;
    stim[53] = 67'h7002b53efc9efe801;
    stim[54] = 67'h5c21d3d5bdc597cb7;
    stim[55] = 67'h74e03fcf3e3bf0f6b;
    stim[56] = 67'h51494b5c3748e5715;
    stim[57] = 67'h4be0cce2abe4fe7db;
    stim[58] = 67'h41b62055603c92c61;
    stim[59] = 67'h7f0685c762bc64220;
    stim[60] = 67'h2246d70499faa1ff7;
    stim[61] = 67'h7603894840ee6a74a;
    stim[62] = 67'h4fd89e48f7dab66d8;
    stim[63] = 67'h3b5105c27290f88e4;
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
      expv[0] = 36'h4d020a220;
      expv[1] = 36'h000000004;
      expv[2] = 36'hd5dc35a82;
      expv[3] = 36'h0a65479c8;
      expv[4] = 36'h899330f7a;
      expv[5] = 36'hefdf67bb2;
      expv[6] = 36'h000000004;
      expv[7] = 36'h53242ed38;
      expv[8] = 36'h620072a30;
      expv[9] = 36'h4e9d03e90;
      expv[10] = 36'h75efbebc0;
      expv[11] = 36'h11ffb1990;
      expv[12] = 36'h000000004;
      expv[13] = 36'hbf5bb1fa2;
      expv[14] = 36'h000000004;
      expv[15] = 36'h000000004;
      expv[16] = 36'hba116ccf2;
      expv[17] = 36'h000000004;
      expv[18] = 36'ha9f6a0362;
      expv[19] = 36'h8fe4f7d7a;
      expv[20] = 36'h000000004;
      expv[21] = 36'h590924000;
      expv[22] = 36'h481a7a488;
      expv[23] = 36'hcbdb21f82;
      expv[24] = 36'h9c912e502;
      expv[25] = 36'h000000004;
      expv[26] = 36'h000000004;
      expv[27] = 36'h000000004;
      expv[28] = 36'h8c3bfa512;
      expv[29] = 36'h000000004;
      expv[30] = 36'h9aef289c3;
      expv[31] = 36'h83853b7da;
      expv[32] = 36'hd3e77ffb2;
      expv[33] = 36'h000000004;
      expv[34] = 36'h4aecbfef8;
      expv[35] = 36'hd09931493;
      expv[36] = 36'h000000004;
      expv[37] = 36'h000000004;
      expv[38] = 36'hfecefbbf2;
      expv[39] = 36'h000000004;
      expv[40] = 36'hb6e85fa72;
      expv[41] = 36'h000000004;
      expv[42] = 36'he38b6efc3;
      expv[43] = 36'h000000004;
      expv[44] = 36'h496549589;
      expv[45] = 36'h1958fb098;
      expv[46] = 36'h000000004;
      expv[47] = 36'h000000004;
      expv[48] = 36'h000000004;
      expv[49] = 36'h0fc023a40;
      expv[50] = 36'h000000004;
      expv[51] = 36'hf02db7e12;
      expv[52] = 36'hd415ff4f2;
      expv[53] = 36'he00568002;
      expv[54] = 36'h000000004;
      expv[55] = 36'h95b79e732;
      expv[56] = 36'h000000004;
      expv[57] = 36'hc008653e2;
      expv[58] = 36'h806800882;
      expv[59] = 36'hc385d3d2a;
      expv[60] = 36'h000000004;
      expv[61] = 36'heddfd6f92;
      expv[62] = 36'h8f66a96ca;
      expv[63] = 36'h91801a683;
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
