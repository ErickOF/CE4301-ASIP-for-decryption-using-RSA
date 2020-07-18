/**
 * Hazard Unit module.
 *
 * Inputs:
 *     ra_id        - source register a from IF/ID.
 *     rb_id        - source register b from IF/ID.
 *     rf_id        - source register f from IF/ID.
 *     ra_ex        - source register a from ID/EX.
 *     rb_ex        - source register b from ID/EX.
 *     rf_ex        - source register f from ID/EX.
 *     rf_me        - source register f from EX/ME.
 *     rf_wb        - source register f from ME/WB.
 *
 *Outputs:
 *     forward_RA   - control signal to mux_fwa
 *     forward_RB   - control signal to mux_fwb
 */
 
 module hazard_unit (input  logic [5:0] ra_ex, rb_ex, rf_ex, rf_me, rf_wb,                    
       output logic [1:0] forward_RA, forward_RB);
       
always_comb begin
  // Check if RA forward from memory
  if(ra_ex == rf_me) begin
   forward_RA = 2'b01;
  end

  // Check if RA forward from write back
  else if(rf_wb == ra_ex) begin
   forward_RA = 2'b10;
  end

  // Not forward in RB
  else begin
   forward_RA = 2'b00;
  end

  // Check if RB forward from memory
  if(rb_ex == rf_me) begin
   forward_RB = 2'b01;
  end

  // Check if RB forward from write back
  else if(rf_wb == ra_ex) begin
   forward_RB = 2'b10;
  end

  // Not forward in RB
  else begin
   forward_RB = 2'b00;
  end
 end
 
endmodule //hazard_unit