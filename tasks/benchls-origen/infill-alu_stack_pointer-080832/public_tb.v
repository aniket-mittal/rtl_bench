// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 86;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_080832 dut (
    .OP(in_vec[85:83]),
    .INPUTA(in_vec[82:67]),
    .INPUTB(in_vec[66:51]),
    .IMM(in_vec[50:35]),
    .SP(in_vec[34:19]),
    .LoadValue(in_vec[18:3]),
    .ALUsrc(in_vec[2:1]),
    .BRANCH(in_vec[0:0]),
    .OUT(out_vec[32:17]),
    .BRANCHING(out_vec[16:16]),
    .SPAddress(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 86'h11936b7e1c0ff08ad62386;
    stim[1] = 86'h0b513a2d3702312a380647;
    stim[2] = 86'h3a2c954bbd8876a283b831;
    stim[3] = 86'h27b53e94b5147ae9ee9195;
    stim[4] = 86'h2371803835960833e22f17;
    stim[5] = 86'h123f13aa32edbb73f20612;
    stim[6] = 86'h23c5afca81cabda132716a;
    stim[7] = 86'h095d9f6c3ea77301b62427;
    stim[8] = 86'h2dc43687285b4645dd59cd;
    stim[9] = 86'h380ec3653f63a58c96174a;
    stim[10] = 86'h3acd8187d3def1b774abef;
    stim[11] = 86'h107b42cb909d5bbd74bbd1;
    stim[12] = 86'h12a241fb9db1a6d906efc6;
    stim[13] = 86'h0c4757582f60e5383c0277;
    stim[14] = 86'h2c2aa5240a5d81d40c1b7e;
    stim[15] = 86'h24a0c32d84ed148338d5a0;
    stim[16] = 86'h3cd28e4ef89270124fc3a5;
    stim[17] = 86'h358137fbd6dc1adb83de4b;
    stim[18] = 86'h287104d2dff121f07ea424;
    stim[19] = 86'h080e7ae8175e873d92c5a2;
    stim[20] = 86'h03cbb5db51a22413da7b97;
    stim[21] = 86'h31bd29b9b25778491a1d02;
    stim[22] = 86'h3cf213a0f0efa9f89a9562;
    stim[23] = 86'h11fd814b9dbc569e8342a5;
    stim[24] = 86'h31982f532248826e38d827;
    stim[25] = 86'h0a9b8070402eb92e6e5485;
    stim[26] = 86'h0bac35cf9c36c65bf68d26;
    stim[27] = 86'h0ad39371f0122c6427c4ec;
    stim[28] = 86'h1034505b357fe8fccb119c;
    stim[29] = 86'h2069076996879f148aebf5;
    stim[30] = 86'h157a0e8000374cdf35d365;
    stim[31] = 86'h322e7023b2072e4730024a;
    stim[32] = 86'h175abd79b6c044ad7e7d9a;
    stim[33] = 86'h2e5f4df49b3a01e67de34c;
    stim[34] = 86'h0b97ae688435d264a4c460;
    stim[35] = 86'h36dbbae69cac73bd677448;
    stim[36] = 86'h07c9769ed80268a02749d1;
    stim[37] = 86'h398c236009b4c6dd7c8421;
    stim[38] = 86'h0d5ddc0fa1e678eee5c2b5;
    stim[39] = 86'h2dc7455a8420dc5590ec44;
    stim[40] = 86'h36a09973e1eb162591333a;
    stim[41] = 86'h0dff71547211306b2b498e;
    stim[42] = 86'h3219f247359cdab8ecd86b;
    stim[43] = 86'h0249dc41f31c922fa03a68;
    stim[44] = 86'h36a24784640170434d05ac;
    stim[45] = 86'h3771b67b3c2103d5e624d0;
    stim[46] = 86'h0a63733fd11dc9f55e79f9;
    stim[47] = 86'h27f08e3b4e761c07e64eab;
    stim[48] = 86'h18136ebce61c5d640ce75a;
    stim[49] = 86'h09b62530c640b6a5cacced;
    stim[50] = 86'h14e4b4fd9e2cde6a901b59;
    stim[51] = 86'h2204fa74c1e8d4e9f11306;
    stim[52] = 86'h27bbd85563b1e12d302c3e;
    stim[53] = 86'h3e4f7346be373d73d1edba;
    stim[54] = 86'h341bc4e124ae515b40218d;
    stim[55] = 86'h2e908a9ff92f11f6435873;
    stim[56] = 86'h2ed31ac5259ea874a04691;
    stim[57] = 86'h09174ae0f1d8435b40b020;
    stim[58] = 86'h1d85e5ae10b67a3de984ac;
    stim[59] = 86'h0319cd66217bc2d5accd9c;
    stim[60] = 86'h37f7c2942f1d7a5c9ca1e3;
    stim[61] = 86'h360e88865997a4cfedaa73;
    stim[62] = 86'h2ab1305e13c38841ca3c6c;
    stim[63] = 86'h1bb756f01cde3e310187cc;
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
      expv[0] = 33'h00002115a;
      expv[1] = 33'h049022547;
      expv[2] = 33'h08b24d450;
      expv[3] = 33'h1da9c5d3d;
      expv[4] = 33'h11800067c;
      expv[5] = 33'h000006e7e;
      expv[6] = 33'h0b500b426;
      expv[7] = 33'h07c586036;
      expv[8] = 33'h15672c8bb;
      expv[9] = 33'h003b0b192;
      expv[10] = 33'h0b36036ee;
      expv[11] = 33'h0000177ae;
      expv[12] = 33'h00000db20;
      expv[13] = 33'h13bcaa707;
      expv[14] = 33'h04fe03a81;
      expv[15] = 33'h128309067;
      expv[16] = 33'h134a20249;
      expv[17] = 33'h0b6e25b71;
      expv[18] = 33'h1a90a3e0f;
      expv[19] = 33'h02bfee7b2;
      expv[20] = 33'h069c0827b;
      expv[21] = 33'h012480924;
      expv[22] = 33'h13c843f13;
      expv[23] = 33'h00001d3d0;
      expv[24] = 33'h09b904dc8;
      expv[25] = 33'h0a6de25cd;
      expv[26] = 33'h17726cb7e;
      expv[27] = 33'h0b4e28c84;
      expv[28] = 33'h000001f99;
      expv[29] = 33'h01a40e291;
      expv[30] = 33'h000029be6;
      expv[31] = 33'h191cec8e7;
      expv[32] = 33'h0000295af;
      expv[33] = 33'h178d23ccf;
      expv[34] = 33'h14bca4c94;
      expv[35] = 33'h0ef5a77ad;
      expv[36] = 33'h19a121404;
      expv[37] = 33'h06308dbaf;
      expv[38] = 33'h157741ddc;
      expv[39] = 33'h03b108ab2;
      expv[40] = 33'h18966c4b3;
      expv[41] = 33'h12ac00d65;
      expv[42] = 33'h0ae3c571e;
      expv[43] = 33'h1a2f245f4;
      expv[44] = 33'h010d4086a;
      expv[45] = 33'h0f57a7abd;
      expv[46] = 33'h1c8e83eab;
      expv[47] = 33'h03f8480fc;
      expv[48] = 33'h17776ac81;
      expv[49] = 33'h06d86d4b9;
      expv[50] = 33'h00001cd52;
      expv[51] = 33'h13e009d3e;
      expv[52] = 33'h1600025a6;
      expv[53] = 33'h193dcae7a;
      expv[54] = 33'h056d22b69;
      expv[55] = 33'h121e03ec8;
      expv[56] = 33'h0c2ec0e94;
      expv[57] = 33'h18d966b68;
      expv[58] = 33'h0222247bd;
      expv[59] = 33'h0c6725ab5;
      expv[60] = 33'h097284b94;
      expv[61] = 33'h133fc99fe;
      expv[62] = 33'h08f1a0839;
      expv[63] = 33'h02222c620;
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
